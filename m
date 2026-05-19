Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666CA3E5A2F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180192; cv=none; b=P+gEuo2rN1emgshWx30AvfMKr0p6wGg9SLPzfpeszj0etbqMelCat6j55sjLewwFWg86aITGhAzvUYSERve0KNTtum6o2o5gMCdAGhU+btssyXMes35kAv+IBeB0/KFy1JOvr5vIoJJumgpIVsZVsSdFuw1ym10lAbNmxDEzlBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180192; c=relaxed/simple;
	bh=GZByO2VDIprL7smzrTiU2wMTuNMdmVEjQ7Th5ILaSAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o1tlODAPz8vXm/NfxS7XamzhMdJ3ARlLlCa/U0KAQg74KHhk1B4R579Z2rJ7mKoOMILvDad1eIS9AlfavJm8IFy24mio5omDgBDBQcjbq8P23IIwGrUxw8skKwAybSPaFj9J7zlnnY/lpcPDq1jO2ZVEonUL+uMRN3ZrO8+jsAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geOMkfgD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geOMkfgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81A0C2BCB3;
	Tue, 19 May 2026 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180192;
	bh=GZByO2VDIprL7smzrTiU2wMTuNMdmVEjQ7Th5ILaSAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=geOMkfgDuDiAtI941M18j+Pf2UpIZ1j8Zdi5hu/1smSeg57NfbIsLU1v/iRtlE1sR
	 H1pLsZ1VhUisluD/8yqwOZqd/CR/QacUmB/gafMydNiq8iATvUfkyjYjEwzQfFExus
	 /s8AjGsR341EEXA4OTyR1ZlcG5JjtLSrFkdOv+kAi/PtBBe6FdkzKo8XP/whOQ8Ce9
	 Xaw2H4uikOBpzmj7M3kN+mMWdM0L+Ym6fg2MhqmV1dRggH0uZ/vWUPWcexUtIMRMJF
	 OMShaWhEg1KvKGzMxWSuJEBqwo80/+YAmeZC8ANO+yYGWe3WzhCGAyZtfM3Ioks55t
	 RHhEGFUDqsIgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] iommu/msm: Look up masters per IOMMU instance
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-mainline-send-v1-sending-v3-4-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-4-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:43:05 +0000
Message-Id: <20260519084305.A81A0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] msm_iommu_attach_dev and detach unconditionally loop over all =
shared masters, breaking IOMMU isolation, causing attach failures, and corr=
upting domain lists.
- [High] msm_iommu_iova_to_phys() performs address translation using the wr=
ong hardware context bank for shared IOMMUs.
- [High] Error path in msm_iommu_attach_dev leaks IOMMU clocks.
- [High] Buffer overflow in insert_iommu_master when writing stream IDs to =
master->mids array.
- [High] msm_iommu_probe modifies a global list without acquiring the requi=
red lock, causing race conditions.
--

commit a857d6e3a3b0380237f9c6c7b9ba76932246dfa4
Author: Alexandre MINETTE <contact@alex-min.fr>

iommu/msm: Look up masters per IOMMU instance

This commit updates the MSM IOMMU driver to look up context descriptors on
each IOMMU instance instead of using a global device provider. It introduces
a helper to search the target IOMMU context list when probing and attaching
devices. This aims to prevent null pointer dereferences when a device
references multiple IOMMU provider nodes.

> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 0ad5ff431d5b6..9c03878d0d2cb 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -357,17 +357,25 @@ static int msm_iommu_domain_config(struct msm_priv =
*priv)
>  	return 0;
>  }
> =20
> +static struct msm_iommu_ctx_dev *find_iommu_master(struct msm_iommu_dev =
*iommu,
> +						   struct device *dev)
> +{
> +	struct msm_iommu_ctx_dev *master;
> +
> +	list_for_each_entry(master, &iommu->ctx_list, list)
> +		if (master->of_node =3D=3D dev->of_node)
> +			return master;
> +
> +	return NULL;
> +}

Since this patch allows multiple masters to be added to an IOMMU's ctx_list,
are there other functions that still assume the list only contains a single
element?

For example, doesn't msm_iommu_iova_to_phys() hardcode
list_first_entry(&iommu->ctx_list, ...) to select the master and query its
specific hardware context bank?

If translation is requested for any device other than the first one attached
to the IOMMU, could the driver read the hardware registers for the wrong
context bank, returning incorrect physical addresses?

>  /* Must be called under msm_iommu_lock */
>  static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
>  {
>  	struct msm_iommu_dev *iommu, *ret =3D NULL;
> -	struct msm_iommu_ctx_dev *master;
> =20
>  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {

This problem wasn't introduced by this patch, but msm_iommu_probe() adds the
newly allocated device to the global qcom_iommu_devices list without holding
the msm_iommu_lock spinlock:

msm_iommu_probe() {
    ...
    list_add(&iommu->dev_node, &qcom_iommu_devices);
    ...
}

Since other functions (like find_iommu_for_dev) concurrently access this
list under the lock, could this unprotected list mutation lead to list
corruption or a crash in asynchronous probing scenarios?

> -		master =3D list_first_entry(&iommu->ctx_list,
> -					  struct msm_iommu_ctx_dev,
> -					  list);
> -		if (master->of_node =3D=3D dev->of_node) {
> +		if (find_iommu_master(iommu, dev)) {
>  			ret =3D iommu;
>  			break;
>  		}

[ ... ]

> @@ -405,10 +413,7 @@ static int msm_iommu_attach_dev(struct iommu_domain =
*domain, struct device *dev,
> =20
>  	spin_lock_irqsave(&msm_iommu_lock, flags);
>  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
> -		master =3D list_first_entry(&iommu->ctx_list,
> -					  struct msm_iommu_ctx_dev,
> -					  list);
> -		if (master->of_node =3D=3D dev->of_node) {
> +		if (find_iommu_master(iommu, dev)) {
>  			ret =3D __enable_clocks(iommu);
>  			if (ret)
>  				goto fail;

With this change, multiple masters can be present in the ctx_list, but
msm_iommu_attach_dev() and msm_iommu_identity_attach() still unconditionally
iterate over the entire ctx_list instead of filtering for the target master:

msm_iommu_attach_dev() {
    ...
    if (find_iommu_master(iommu, dev)) {
        ...
        list_for_each_entry(master, &iommu->ctx_list, list) {
            ...

When the first device attaches, does this incorrectly provision hardware
contexts for all shared devices using its own domain, breaking IOMMU
isolation?

Also, because msm_iommu_alloc_ctx() can return 0, the safety check
if (master->num) evaluates to false for context bank 0. When a subsequent
device attaches, the loop re-allocates contexts and executes
list_add(&iommu->dom_node, &priv->list_attached) a second time. Could this
result in corruption of the doubly-linked domain list, leading to an
infinite loop and hang?

If a non-zero context bank was allocated, subsequent attaches hit
if (master->num) and unconditionally fail with -EEXIST. Would this prevent
shared IOMMUs from functioning?

Furthermore, does detaching one device via msm_iommu_identity_attach()
unintentionally tear down active DMA mappings for all other shared devices?

If the loop encounters a master with a non-zero context bank
(if (master->num)), it sets ret =3D -EEXIST and goes to the fail label:

msm_iommu_attach_dev() {
    ...
    if (master->num) {
        dev_err(dev, "domain already attached");
        ret =3D -EEXIST;
        goto fail;
    }

Since the fail label unlocks the spinlock and returns without calling
__disable_clocks(iommu), and shared IOMMUs will hit this reliably, does
this cause a permanent clock resource leak during probe/attach?

[ ... ]

> @@ -601,10 +606,10 @@ static int insert_iommu_master(struct device *dev,
>  				struct msm_iommu_dev **iommu,
>  				const struct of_phandle_args *spec)
>  {
> -	struct msm_iommu_ctx_dev *master =3D dev_iommu_priv_get(dev);
> +	struct msm_iommu_ctx_dev *master =3D find_iommu_master(*iommu, dev);
>  	int sid;
> =20
> -	if (list_empty(&(*iommu)->ctx_list)) {
> +	if (!master) {
>  		master =3D kzalloc_obj(*master, GFP_ATOMIC);
>  		if (!master) {
>  			dev_err(dev, "Failed to allocate iommu_master\n");
> @@ -612,7 +617,6 @@ static int insert_iommu_master(struct device *dev,
>  		}
>  		master->of_node =3D dev->of_node;
>  		list_add(&master->list, &(*iommu)->ctx_list);
> -		dev_iommu_priv_set(dev, master);
>  	}
> =20
>  	for (sid =3D 0; sid < master->num_mids; sid++)

This wasn't introduced by this patch, but does this function lack bounds
checking when appending stream IDs to the master->mids array?

If a maliciously crafted or malformed Device Tree provides more than
MAX_NUM_MIDS (32) stream IDs for a single device, could this result in an
out-of-bounds write, corrupting adjacent heap memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-mainline-s=
end-v1-sending-v3-0-3dd7aa125353@alex-min.fr?part=3D4
