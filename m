Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747EF376BEA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346914; cv=pass; b=YHLPr+uhyW5FLZPJnsIgrRMoGTKT8vDh1xB+l89i0VnoLhg/Wwk0+LDpC0OxRulnZvoLd2QVI2uUXpnyLMMC+aZUb7svo8BcfJ/PtciymOBGqLE/q+o3ca4J8UlhzDTvh/NvwPJeuQ+O8IN5rPLyLyp7Q95wvD7wSWCMk9cYu1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346914; c=relaxed/simple;
	bh=ANwWX/awSG4OoMeEHmBku3xc6bNHerEHyEoJpAywXKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlBdbBX56ANLntfcIuE8KR3XdxtLug2RJI7onIdnqekyV9S0bXmfDq5rWkN6WyU7jBvymKR5GJe8OtrqY8oL6/GuwgMgvcsWhEGKrNLVS8UglBjCtYRM8tYwjHyLNKKVxyc51yfkuEU8ii/2OFIGCINXANGRAvOE++wQqpHCkmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXabOkOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmXEmm4B; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXabOkOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmXEmm4B"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxEEZ395311
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=; b=VXabOkOaPUWLw7as
	0gTDE/OWPn8J6R6Z6nP/esOJc2az2bjzwO6S3yxPBoZEqQt+H937ZQzBfQyNRgf0
	CShBdG5/8PlHZq4zbstr6j10keeUEfjj18HlRzX+RG3gh/AXr0ifxHhfRdEIdejH
	Z0DMfa6wIIpPZw4pUxpoKi44xlRdyTptWR5/zucXWWIR5/7frlTMaCtjlUc9AQOh
	7GVO3scwWIujl7dy2dfWi7f6tHF84UpI1gWTV5aeEN/BlR0Ud6TfY22z4eBLgNd0
	B2nDqAJXGW4SFqSLFzkWn4H8wIWNZkPsi8Pt7WXETOttmU6dafG+aeTvSfdBGCVn
	ucitRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qph45a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:08:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e68cb7a3eso568650285a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783346912; cv=none;
        d=google.com; s=arc-20260327;
        b=STguV8UgK8DoQmUx3sH2n918bKU5nfbE+C4yCos/2tA9UzmquRUwBMJE+Oxyr2sb/6
         7MKYjrpBVvHU4M+8pEUyN+byN1oMeYujuFOfzUTKLIOuD5MZbpZUpTCAw+06kmY644Fo
         BocFX6frPk5yeuGmwz3N6VWRr7WAq6roTjxt12tiO4ZdBTNavivGMuNwg4e9UpWjSyqj
         muatm21PdY1wE6ke7MN2oGY2OYz5t/c9xQjgw0689n+ras7/GvmUYgLBbYycw0S2uURY
         NQ+HbdP5Nk8NJv5LAqtGzPodpfjk1kxxI5spSKbpAbkTIedh8gLpsEn1osQCgNGuCk71
         CPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=YszT/V6gYQX2dhd2Oqgca5vCFpIewf5vGsghdkNtpTFleIg0Yuhr89Lmhn2XIIoGzX
         WQ012IKe8NgcMIFer3Z8jOnKeGEQPuSelSrJ1MLdS+A1yFhmXX4znzRrNP7y8Oh4suK5
         mTsNZ54vbAb2H8IfGsu1a42MX2pWqFmZU4sEiemyfxF8cH+Wgqp557xTb4npy1iHTrSR
         GyRSVPpHdnJ2pmsPwh8fqWGisphpkSQkZVtlwwzMka1lAWYK7NYgSs6Ed+kMSNzpz/H5
         56CPXbzvk5bKhGm19COcHerothLCgdsKlm+QmpaGTdp2e26ZeMzibY6CSV+dldWS4M5a
         wZ8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346912; x=1783951712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=;
        b=DmXEmm4BkESHYCebfOVfuSXP7P1KkURGCwwahyXILTEJTcmNfvdSYKpKof+uOclkhR
         l0nUwC0pYMMXSwObhwwWDBz7J+EboN0DR9O83M2tjmFBZzU/6/2Kk9UTQ+Xeo0xVo8LW
         5CXK5r/6GnbLmcazRfTX5J9CoayLnI/msNhXCKbfPXi4pG0noI4k2X/akeu4YS2kv4Hm
         0JnuAJKGjX3gHuMn822hP/+U/HfOX9hatfoVIP3PRTCBNsiLU6OUOi4jREScIPkbLv0l
         7tIts44JAB7W0Pzs171qt04Eo8ytNWRyDbigWq5Orc+9+Jzd+dq+yGYX3qb0RfwPRu3J
         Af2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346912; x=1783951712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=;
        b=TOcKHsPmjdkLkZOpBnGDF6fzNJ0pluyU5GMSYt5s+Z+fubQOoKwUWEBH13q52sEKVi
         ZkU1afF4OkfU3b9gWgGWax3AeeoZEE9eZCwGgU0eo235+QbJA4/Whrts+85CKFMNDNAB
         M57TsNub+IvwQ0eVRG9etOwXRCvlHbCMNuI62DFhNVx5IarDj0137Va7iNUmTlumhvbb
         GgptuIlwrQQyhS3z9GzuiLhK4mAwyMKYaQPiVWIxcugOrsnIx8jg5fOQqAxZZzGeEHx/
         raw3B22IYLgL+YDy7NOSMQNV9qS9NctDmq++cPNvKeOmOoc1edfnFPME31EkNroA0G7L
         hK3w==
X-Gm-Message-State: AOJu0YyqVtYbwxpZV3GK2ifr+XVXnNTf+INF9jmmlmceb4QXfw65mDoL
	cIBxF2pwyKN6dHH+LGUCVSxtoFsem/wnKdyoqfw+3HESxC2l51oeuFXumeWWeYP+4fy2r9muhzE
	f7iynNhMv/3BBwKNQfXcPX7nLxmetCyTZ4xqDgFTB1dXPD9CV29T46ke3hts0+K8jGP7G3My04H
	NW4guWOFFIAUQDVjEVzncmemwrC46gJY9eGIBdRsU=
X-Gm-Gg: AfdE7clopeBxo9sm4rVsTSffR+F+ksyCCmy3vAXa0W52K1T7eti0FpbesMqhbNAx04K
	Fa14DiV1pJ4PtDS2cM3E2KMbRTGnjrRJ42hHe1Bofq3pu0Sxs7pIaZJ0ohpnFQw2C0xGUExnm8Q
	ua76C9/59NIgppcymyTTeewVPaMzbl9Mukxgj5XEwrFpyNGCAnyRsNMb/6LbbQyREtZDl494gTo
	MBP0a8m3JReSOfA5sirW1QORCN/bd5vFopcuG+ZPF3idZfwXUQxW71ju/NVgLcYzUaxpAPVmPOW
	tWER98TDjsE=
X-Received: by 2002:a05:620a:1d0c:b0:92e:6b95:237a with SMTP id af79cd13be357-92ebb505f08mr99512085a.32.1783346911569;
        Mon, 06 Jul 2026 07:08:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:92e:6b95:237a with SMTP id
 af79cd13be357-92ebb505f08mr99506385a.32.1783346911118; Mon, 06 Jul 2026
 07:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com> <20260704134554.D6C411F00A3A@smtp.kernel.org>
In-Reply-To: <20260704134554.D6C411F00A3A@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 16:08:20 +0200
X-Gm-Features: AVVi8Cf4y-UzXQaofe6s9LCv8tELszbF5_LVcMZ06_qZWzpG2wpn6piYqqoSY1M
Message-ID: <CAFEp6-1mjx74Z12noBZOVu8mBk6+nbqMxxtZLYYqHvJ=qSaPNw@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] block: implement NVMEM provider
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bb6e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8
 a=Rk-JEQ0JuZRAwbGkdHcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-ORIG-GUID: 1Mi5fhltJygrO0ZRFZdGcWPLlvLXlM8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NCBTYWx0ZWRfXz1F1ylotomtv
 6AoXuoTmJ6HDvexYHj7skrexQgM4Tsba4mwEqquzP+9NO5J+8rGvbuNn/BJsnKPIsBSTi6cE1C6
 JkcbAidD0RCKa+EiqtlA5PUQepbgy3lRJpG0rkiHF7u7yTI7we7v3WyF1y5qGpTRYvMlx2TJtW7
 phA5N1x52xDe6phZUmS8tqq1XiA1IMzib8ynsGGTlPxn8qCTgUevev8c69fTEjizky3QfuYmSU8
 Xe2iKU0zO8OKSwgqyxB02BKBWI6tKLkZ/d7qbFSKgIqT5wfeA8Ps2rUN8gc+ewsBwpTAvBIpu2w
 ikWqH3HnSyU1hXU5+6mjedZ2lb7DKaoCWmFEzOWsWoV4lnvIZ/oeDla1dtLTLr21exbvRbTG6/h
 +pX6Ja8/e0i9dXh4DLURr7qH2TebsohtMaCTwqXKspcvDGx+O8XXMDx75wgQszJlDmVpYLXKqZy
 dLwtjMrzhnh8VeGlS1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NCBTYWx0ZWRfX6LxBVbpO77Ur
 jxVxlis/hpjnKExZntiB1QtoxABqAibdePI9juU/mW90XvvViQ0HRvr0NNKW+6ickSQlrITQA78
 rdIYhcIEPaLyzUKdlIGpBV40EECImFM=
X-Proofpoint-GUID: 1Mi5fhltJygrO0ZRFZdGcWPLlvLXlM8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060144

On Sat, Jul 4, 2026 at 3:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The NVMEM provider incorrectly sets `config.owner =3D THIS_MODUL=
E`, failing to pin the underlying block device driver module and causing a =
Use-After-Free if the driver module is unloaded while a consumer holds an N=
VMEM cell.
> --
>
> commit 658c388a96462e54e252d777f2fc96dcf4f36d59
> Author: Daniel Golle <daniel@makrotopia.org>
>
> block: implement NVMEM provider
>
> This patch allows block devices or partitions to act as NVMEM providers,
> exposing factory-provisioned data such as MAC addresses or Wi-Fi calibrat=
ion
> blobs. It introduces blk_nvmem_add to register the block device with the
> NVMEM framework when the appropriate device tree nodes are present.
>
> > diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> > new file mode 100644
> > index 0000000000000..642a12f8a8b1c
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
>
> [ ... ]
>
> > +int blk_nvmem_add(struct block_device *bdev)
> > +{
> > +     struct device *dev =3D &bdev->bd_device;
> > +     struct nvmem_config config =3D {};
> > +     struct nvmem_device *nvmem;
>
> [ ... ]
>
> > +     config.id =3D NVMEM_DEVID_NONE;
> > +     config.dev =3D dev;
> > +     config.name =3D dev_name(dev);
> > +     config.owner =3D THIS_MODULE;
>
> [Severity: High]
> Should this owner be set to the block device driver's module, such as
> bdev->bd_disk->fops->owner, instead of THIS_MODULE?
>
> By setting config.owner to THIS_MODULE, it seems we pin the block core
> module but fail to protect the actual block device driver (like mmc_block=
)
> from being unloaded while a consumer still holds a reference to the NVMEM
> cell.
>
> If the driver module is unloaded, its module memory is freed. When the
> consumer later releases the cell and the bd_device refcount drops to zero=
,
> could disk_release() end up calling disk->fops->free_disk on a now-unmapp=
ed
> driver module pointer and cause a crash?
>
> > +     config.priv =3D (void *)(uintptr_t)dev->devt;
> > +     config.reg_read =3D blk_nvmem_reg_read;
> > +     config.size =3D bdev_nr_bytes(bdev);
>

The use-after-free you describe does not occur: this is already handled by =
the
Bartosz nvmem core rework [1], specifically "nvmem: protect nvmem_device::o=
ps
with SRCU". So when e.g. mmc_block is removed, nvmem is properly unregister=
ed,
and its ops are nullified. A consumer reading a cell afterwards gets -ENODE=
V,
not a crash.

[1] https://lore.kernel.org/all/20260629-nvmem-unbind-v5-0-233212f241c4@oss=
.qualcomm.com/
