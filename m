Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079889;
	b=mUAqzVP2fq+Qq3CNsdlUbHWLQVGQlNamT1dPqpvQrlugyqO8wQnTuD5mXZ0kVKTJHhZ+
	 eKr+iu/N1dzQ0aIPsfpLo4uRkX+glXKBfEbCiMAyMGuCy2v883gK2FDNw55MBpmgZNI7A
	 RSceTHQ1SanjkoevXDJ9fbs1Ts0nEfqLY+z3+hPy67uN+jAlm6XxSI+PzlRAWcXCVsYbP
	 wFrx1CaVv8Pw0j+/yLpY4INQgS/dgolI9HONWVYLlWd63ZWEtPHw2H5nGjpxWu2gBJuEa
	 ikF6buBoExH4fqM3MZTJBgfOIiyrLGo+ctk+qDZNc+URJWKPOwnvN7HhIdHaOLXTzTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079889;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3J5KyemgEPHgTrVi6sWSrpdroLe8lWPfdywBPL6YU/E=;
	b=MYld6RunoJHlzAfdDeTGi7/ZHAaL1uO3gp8skLA6dcFQREWnjkBJqkLkeEpW4HomAUZm
	 cd0VHrfM85Si/fPnh6gOBWixElRhkaNtsICbWYde/cI9sFIugJ9DRUGYH7VHKFvoRqUD7
	 GkWMQ4yWXQAqws+x0CLJq2+RJ+MJYMsxh7srg4F+vZ6VU/fhwPQKoNhySfzeBevDIYgKG
	 vrHxL8d8P2S4eHBE7+2NrXs1ogoSor9z24M40gFXrlVkXUB5MqdfnEh+67I+rHS5a8Kgt
	 uaPndKhHVqTG1vT6yWMGhSoXvVE9aCGxbkrS4AY2yFQ+qMjY78guaGXj1HU+VFjfvwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfFsLd8X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99A606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfFsLd8X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DA71F000C4;
	Thu, 19 Nov 2026 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079888;
	bh=3J5KyemgEPHgTrVi6sWSrpdroLe8lWPfdywBPL6YU/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfFsLd8X+7uS+xGQzYukBzpftIJyZfPqHE+If8ANSpKsiHt6anidt4kiq5Is82kyI
	 bYuAgQcOwqsj4OEHGZ4vToLoRAurESjS16mrLxCYCtoPHuSE4Qyp9WBSqVAEuYzQ1s
	 dgIMk/0sAdOHzvx2f+0QZ2v1l+vNh77u7zldIS+tabOLrz/hf7tA9UU+w17slWUb8U
	 Xl7iguMATTOoSbmv6q6etHuQWi50yk9GRgdrT/gS68J/Sc94Qix6oKW+SLuJ0z7jtM
	 Dw4lSSZgn5EA1KvIq2EcNoMXM3jk2738/9XNEAs8lSobyjnK1h6GFHDEYiWus1FdKP
	 Dlc+yBcWCoExg==
Message-ID: <sashiko-outbox-222809@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/6] soc: qcom: add QDCP firmware provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-2-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-2-b1a730d2c57a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:18:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] soc: qcom: qdcp_send_resp() callers pass struct size as QMI
  wire length
- [Medium] soc: qcom: devm_qdcp_get() races with provider unbind after
  unlock
--

commit 0767c9931547d43da1782dd32902fb9f2ad363f7
Author: Jie Gan <jie.gan@oss.qualcomm.com>

soc: qcom: add QDCP firmware provider

This commit adds a QMI service provider driver for the Qualcomm Debug
Control Protocol (QDCP) so consumer drivers can enable, disable, and
query QECP firmware-owned debug and trace blocks.

> diff --git a/drivers/soc/qcom/qcom_qdcp.c b/drivers/soc/qcom/qcom_qdcp.c
> new file mode 100644
> index 0000000000000..295138b298819
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_qdcp.c
> @@ -0,0 +1,985 @@

[ ... ]

> +static int qdcp_send_resp(struct qdcp_data *qdcp, unsigned int msg_id,
> +			  const struct qmi_elem_info *req_ei, const void *req,
> +			  size_t req_len, const struct qmi_elem_info *resp_ei,
> +			  void *resp, size_t resp_len)
> +{

[ ... ]

> +	ret =3D qmi_send_request(&qdcp->qmi, &sq, &txn, msg_id, req_len, req_ei,
> +			       req);
> +	if (ret < 0) {
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret =3D qmi_txn_wait(&txn, msecs_to_jiffies(QDCP_TIMEOUT_MS));
> +	if (ret < 0)
> +		return ret;
> +
> +	return qdcp_check_resp(qdcp, qmi_resp);
> +}
> +
> +static int qdcp_send(struct qdcp_data *qdcp, unsigned int msg_id,
> +		     const struct qmi_elem_info *req_ei, const void *req,
> +		     size_t req_len, struct qdcp_resp_v01 *resp)
> +{
> +	return qdcp_send_resp(qdcp, msg_id, req_ei, req, req_len, qdcp_resp_ei,
> +			      resp, sizeof(*resp));
> +}
> +
> +static int qdcp_set_state(struct qdcp_data *qdcp, unsigned int msg_id,
> +			  u64 id, bool enable)
> +{
> +	struct qdcp_state_req_v01 req =3D {
> +		.id =3D id,
> +		.state =3D enable,
> +	};
> +	struct qdcp_resp_v01 resp;
> +
> +	return qdcp_send(qdcp, msg_id, qdcp_state_req_ei, &req, sizeof(req),
> +			 &resp);
> +}

[Severity: High]
Does passing sizeof(req) as req_len cause qmi_send_request() to fail with
-ETOOSMALL across all QDCP requests?

qmi_send_request() passes req_len to qmi_encode_message() as the maximum
encoded wire payload length, and each top-level TLV adds a 3-byte TLV
header (1-byte type + 2-byte length) to the field payload.  For example,
struct qdcp_state_req_v01 is 16 bytes, whereas qdcp_state_req_ei encodes
two top-level TLVs totaling (3 + 8) + (3 + 4) =3D 18 bytes.  Because
qdcp_set_state(), qdcp_stm_source_enable(), qdcp_tmc_set_param(),
qdcp_tmc_get_param(), and qdcp_tmc_assign_buffer() all pass sizeof(req),
every exported QDCP operation fails in qmi_encode() with -ETOOSMALL.

> +struct qdcp_devres {
> +	struct qdcp_data *qdcp;
> +};
> +
> +static void qdcp_release_provider(void *data)
> +{
> +	struct qdcp_devres *devres =3D data;
> +
> +	put_device(devres->qdcp->dev);
> +	kref_put(&devres->qdcp->ref, qdcp_release);
> +}
> +
> +struct qdcp_data *devm_qdcp_get(struct device *dev, const char *phandle_=
name)
> +{
> +	struct qdcp_devres *devres;
> +	struct device_link *link;
> +	struct qdcp_data *qdcp;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!dev->of_node)
> +		return ERR_PTR(-ENOENT);
> +
> +	np =3D of_parse_phandle(dev->of_node, phandle_name, 0);
> +	if (!np)
> +		return ERR_PTR(-ENOENT);
> +
> +	mutex_lock(&qdcp_providers_lock);
> +	list_for_each_entry(qdcp, &qdcp_providers, node) {
> +		if (qdcp->of_node !=3D np || qdcp->dying)
> +			continue;
> +
> +		if (!kref_get_unless_zero(&qdcp->ref))
> +			continue;
> +
> +		get_device(qdcp->dev);
> +		mutex_unlock(&qdcp_providers_lock);
> +		of_node_put(np);
> +
> +		/*
> +		 * A managed link with DL_FLAG_AUTOREMOVE_CONSUMER (i.e. no
> +		 * DL_FLAG_STATELESS) is required so that the driver core's
> +		 * device_links_busy()/device_links_unbind_consumers()
> +		 * machinery forces this consumer to unbind before
> +		 * qdcp_remove() can proceed on the supplier, and so the link
> +		 * itself is dropped automatically by the core when this
> +		 * consumer unbinds or fails to probe. A stateless link
> +		 * carries neither guarantee: qdcp_remove() could release the
> +		 * QMI handle while a consumer still has outstanding or
> +		 * in-flight QDCP RPCs, and device_link_del() refuses to drop
> +		 * a non-stateless link while the consumer is still
> +		 * registered, which is always the case from inside a devm
> +		 * release callback.
> +		 */
> +		link =3D device_link_add(dev, qdcp->dev,
> +				       DL_FLAG_AUTOREMOVE_CONSUMER);
> +		if (!link) {
> +			put_device(qdcp->dev);
> +			kref_put(&qdcp->ref, qdcp_release);
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		/*
> +		 * The core still creates a link to a supplier that is already
> +		 * unbinding, and will not unbind this consumer for it. Defer
> +		 * rather than bind to a provider that is going away.
> +		 */
> +		if (READ_ONCE(link->status) =3D=3D DL_STATE_SUPPLIER_UNBIND) {
> +			put_device(qdcp->dev);
> +			kref_put(&qdcp->ref, qdcp_release);
> +			return ERR_PTR(-EPROBE_DEFER);
> +		}

[Severity: Medium]
Can devm_qdcp_get() still race with provider unbind after dropping
qdcp_providers_lock?

CPU0                              CPU1
devm_qdcp_get()
  mutex_lock(&qdcp_providers_lock)
  /* finds qdcp, !qdcp->dying */
  mutex_unlock(&qdcp_providers_lock)
                                  __device_release_driver(qdcp->dev)
                                    qdcp_remove()
                                      qdcp->dying =3D true
                                      qmi_handle_release(&qdcp->qmi)
                                    device_links_driver_cleanup()
                                      supplier->links.status =3D
                                        DL_DEV_NO_DRIVER
  device_link_add(dev, qdcp->dev,
    DL_FLAG_AUTOREMOVE_CONSUMER)
    /* link->status =3D DL_STATE_DORMANT */
  if (link->status =3D=3D
      DL_STATE_SUPPLIER_UNBIND)
    /* false, returns dead qdcp */
  ...
  device_links_driver_bound()
    WARN_ON(link->status !=3D
      DL_STATE_CONSUMER_PROBE)    <-- warning & bound to dead provider

If the supplier finishes unbinding in the window between dropping
qdcp_providers_lock and calling device_link_add(), supplier->links.status
is already DL_DEV_NO_DRIVER, so device_link_init_status() initializes
link->status to DL_STATE_DORMANT rather than DL_STATE_SUPPLIER_UNBIND.
devm_qdcp_get() then succeeds on a provider whose QMI handle was released
and triggers WARN_ON(link->status !=3D DL_STATE_CONSUMER_PROBE) in
device_links_driver_bound().

Even when device_link_add() runs while the supplier is still in
DL_DEV_UNBINDING (setting link->status to DL_STATE_SUPPLIER_UNBIND), the
new DL_FLAG_AUTOREMOVE_CONSUMER link stays on supplier->links.consumers
until the consumer's probe failure path runs device_links_no_driver(), so
device_links_driver_cleanup() on the supplier can win the race and hit
WARN_ON(device_link_test(link, DL_FLAG_AUTOREMOVE_CONSUMER)).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-introduce-=
qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com?part=3D2
