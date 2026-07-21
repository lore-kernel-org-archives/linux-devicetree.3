Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A86C4582DE
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672295; cv=pass; b=i7+bUpMsBMCMK8LrGb2wuGMMZQhbf1mAaxfUf66uLInMx4M6NafipXR5o2wtOcIgnykCJDWpVJYk4cdVS8ScTpJb5rbqpN18om8bceVxfISrTeGSEgqz1DOvhkct4SXTWeCyatNt9Yjq+UyBuNf9zxcAnfeIK1oINANs21iWen8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672295; c=relaxed/simple;
	bh=xZDw3qWYx6idkwc38s7EFwMQhSOg5smucdIhJc7TGm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBIM+eq061gpUag0J08PMGLPrmgn3t0ARqkcBbquH/0sBdBGgd/Jcj0tFbn1kMNFFLP2uDEaVT0jq5697vhYwPQFes79TZ2mNxWzTzBn8WO9Y4N8w+16El+UyCKnF4QlewlOO2ayD2Xt2vF0jnEAREfX4UF0KccFnlj1nrqeUYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkfkYemr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfvHlcAI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkfkYemr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfvHlcAI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlUOR2951501
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUwScQfXEzBdJGQxsCQcOplLHg2PpU9lXhz21DYQ+nM=; b=fkfkYemrqNX2MOTK
	FBCrnVzNpYn+VWx2gc9ZSonhx1wtSfoiA2ipY+unjmZvBxOPSukiWk8Oab19tb6Q
	7DOQ1PVqY94C5fmVInCfJl5fccw4Lnm5wBpVXygy81JeNjubfxyVemzWcCqTs60d
	p6aiBjJ1iGljLl/gbHz5J1MrrVLezdN+TFEFOvi76+VxuUmTB07ON27n9Fh88g1W
	GIZZ5BYQUpzQVHMxzLIdQVoi+LFlQBlgST4ea9HX8SKeuocBdUPIUzcaDR1Z1mYU
	2vHKPfL8JsQGDsngBgqBNMnUSuBhizsE7TsqraB4HHSBlKIk0vtXhjTMSynpGfBT
	vD75Vg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d93m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:18:08 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81df8abfa7eso216587657b3.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784672288; cv=none;
        d=google.com; s=arc-20260327;
        b=CPFP7kJbruc/i1PpAkuauZTK4Hick1L4ySbTUr/anNxyHVuI8f3zgw0PJr5Mh8s6tr
         NRWz2WmZGci+YllWbxkP8Vauj0DCzMglE+5/zjoezrnySV7C0/0PO9u+s89yGyzlSekb
         B49sOmbm/sSfmSK2vIbYv09WGpaniLNPrNpOrrwjWoPgiVonLHZ+X/VxRHtVKYBTzX/f
         ohXBNq7V3B7kXoAeeUGdrtfHTrcjP+5BEoi5Ag8MYF8Tc1de3ojeFocdLA70PWnLWoSh
         QSGr2FzW1RiUTdUt06G7QMtLLie4S4/g4vKlJAG87S6A5ELXsacOMDSI+rOc8d+fcYG5
         +mxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUwScQfXEzBdJGQxsCQcOplLHg2PpU9lXhz21DYQ+nM=;
        fh=tAVOrqiUU3hzeoozr8blU/u8cdGfcn9v7n2jpU5HElE=;
        b=gS+G0tWRqsbjj1IbXuZCRVzUdUjMhrw3XPd4WI861iNm8vQwasFj8ZKor+XZSorL7r
         55UaKKGMK4OJd+k53Vdak6KVlxRYxaZbCu5SfwYCatkUada8sz9/bntUR0HqtbdOrY3B
         qv23G44hRK6ro3jbIbzqQkuWm0DdRUBUuWX6qpBWPc0paBi+VmZ+LLos29iYvDEtNk0u
         Zs4GamaZwL8DM60j8aHXzpjbA7eyho5zIZS5Y+P2Ud4156yvvMgxJ+tMkQyU5PUi/DTh
         md4Nq/LFNz+L9/UZj1l4NlKyp/qvGV3e0DCGgiLe8sZ8Tkk1BeyYsW1p72dJHEvhZjad
         s3lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672288; x=1785277088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUwScQfXEzBdJGQxsCQcOplLHg2PpU9lXhz21DYQ+nM=;
        b=XfvHlcAIbvKe+bvXbi4uZtAPOhE+p78pRhudSUGNKap3zT0qhvJI0Arz3BGIG07pzN
         k7mh86Fbi/yveQ+t6qvL39+sW2Tja1VAx/1pYIJXE/n1rPZ5ag+VHmyOD+5BSQ5t8XEa
         +8tvWPgckNX6ZMu/5r7EL+cb7hli6sVZEANn/uHO+I8YAJLfCvMFGcpEX1u9ReulTapW
         WQVInyC7cFURGLsHy2stVCdwnA9FmW/rPVmOMWtaCGDnm2gfxVAdrE3cXq94TdQwVE1n
         zKp4seCP+w3G8CTdopiQIcfz2QEnucrVu85twRBe2w7FizwFRK7JukJllg0LpHyb7vIp
         cRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672288; x=1785277088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUwScQfXEzBdJGQxsCQcOplLHg2PpU9lXhz21DYQ+nM=;
        b=f25vIUYhA+IrpM5pNt7XSdkSmGb+NHf4OgVEWmhJEVLpkxwfYU/LsvbEfW2aRcg0Op
         upaBGFr5w3ocsJzhK/TkgZSZMHKZ/vR5Oam54KUERaSH8/mjqnB+4wdglLA8+skwC7JS
         5QUVdl3rn2takLaF6N3N9xpS18ZH0ziEawCMOAvtrlpOFz/BC8NT2PvZp2Vhgw9bkDAX
         GOFW+DsCEkt0qcCjhTuDlu4Vrcie0b6CVl5esODYBleTPFGVlqQfFwwF9boR3mjH4U9y
         ld4yq1lWouWlY2hVcUxxrW2lHV2GFSlf7Bpn4SXCmY2qQ+gwYc66vwgXEe6xZjW7AoEa
         7jcw==
X-Forwarded-Encrypted: i=1; AHgh+Rrxjv4AOs/om9htIUM9O7Q45H4zNK4tITj0o/HTNUiKAfumLVrFSB2lROZZ2pCZVMEhJrTj5J9gO0EL@vger.kernel.org
X-Gm-Message-State: AOJu0YxkP5YOe59B5ZK6rj2TB8PXA5Nwpp4Ww9wkzYeYRjfj6dTtqNNI
	2pFBXtUacr4+/D7FuWyP0xuqXpdePTd1GcIL3g+JIcKkWt3Bhe4LVRqqH2yh2eGjNWUGOzg6mp/
	qNmWfojCBKMv26/XW/zH36oCtMnVRr6fRrQ1Z1cnR5ds4f0qXH9uxdzHlroBUsX7Ia34hHS9hS2
	xyA/vIL3Bfqw2x5lgM5wjPVn4/Ww0T2e80OQ4Pxxg=
X-Gm-Gg: AR+sD12yep5sxbKSfBUspfZqvpzC9QQDq9K42hH61mN5pHwtukcHzWh/02sEle0SU2J
	+HWQn9XZB0aUTwCtqGYVE9Ew7+MY5dvEtclW96qBFMC7hI7LRB+3l6f08OtGpoBLg6FMLgvr3XA
	haOKFYi3vEB+fKJonhDNTloJzwAqKVov5Htsb2+70qgI10m9rbb2QkT4ddSheSI00M/uwwLoU=
X-Received: by 2002:a05:690c:968b:b0:81e:45a6:bd52 with SMTP id 00721157ae682-81ef2611184mr65084097b3.34.1784672287751;
        Tue, 21 Jul 2026 15:18:07 -0700 (PDT)
X-Received: by 2002:a05:690c:968b:b0:81e:45a6:bd52 with SMTP id
 00721157ae682-81ef2611184mr65083997b3.34.1784672287116; Tue, 21 Jul 2026
 15:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <54G6QklSf6TM84GOR9hmCKOLJ_kQuzVolJUAJr8Su3aMmp5xV8Dfe0XZit4C40O5QbDM3UpW9zB9K17ApAbqVQ==@protonmail.internalid>
 <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com> <e6983266-da39-4f75-b11c-d4b79cea27a3@kernel.org>
In-Reply-To: <e6983266-da39-4f75-b11c-d4b79cea27a3@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 01:17:55 +0300
X-Gm-Features: AUfX_mxN6KfvuvgosvqqJFyI52HALYTSRAxwW2rXUNZQNWiE3EF9lNssW1KsRoQ
Message-ID: <CAO9ioeUWfrQcZ++Ja7tSN0VqFGmbKgacgxo_PnDo9p0QaO+6pg@mail.gmail.com>
Subject: Re: [PATCH v7 01/18] media: iris: Add Gen2 firmware autodetect and fallback
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMCBTYWx0ZWRfX/Lqf0k11qInH
 5tP/zvAK21MdKv+DkowZ6a8XhgGP6EZLkKylupJTFND690L6Iedg8RmD3JTG1Njy1PAAOYu7qpW
 1+CmIRiCsG9UN6nWM4Y7efYwkAzj7CE=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a5ff020 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=exvcvJjkjpxh6USlrkIA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMCBTYWx0ZWRfX5+yhMzNi4k+C
 PD7wgOzecn4ph5/FzK7iAdUvJddE1qnYaZX/+DqpOHwBHOkfR8NROLBfxC6YILKAxewjDVLixv6
 GCnygxMBaqMd+v4/cAovQE7gPs3KxE2xXxlHZgasln39ny+ReJE0vENG0mwL9LxHZLgkM4fDS1W
 5Ty5GVRG+EP1Nmtj6IiGVSAX0wSfu70Za1izQ5qYntd80EHtj8O+OzU4x1qfR8/AyGZW9zVuUSm
 NpumhzjAqiQz2jgrmZ1aup5DX1C1Sg7afFBBQRDYJqa0goY8i78tDcl0c6gdfjrqECP6eeCxz6J
 tmOjFAo0dNZ52BtB0qsay2HwbQBDaWQiMzCzCCzlHprSeL/D+rG/AM43Q3RKYQyAkrL2tZxeBAE
 uHd4JrKMdWK5ckLguTqFWalQvfTiUZ33UL1Fom3ZRCQpxEEwNEY5WHS5e4W0dld/6DiQ1jGGhIF
 8xn+7gDq8KoShq5HCjg==
X-Proofpoint-GUID: g1gUy5xX9w6y1pVeM1R-oedxRuFdlnRn
X-Proofpoint-ORIG-GUID: g1gUy5xX9w6y1pVeM1R-oedxRuFdlnRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210230

On Wed, 22 Jul 2026 at 01:15, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 09/07/2026 14:41, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >
> > Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> > Update the firmware loading logic to handle this generically by
> > preferring Gen2 when available, while safely falling back to Gen1
> > when required.
> >
> > The firmware loading logic is updated with the following priority:
> > 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> > 2. Gen2 default : If no DT override exists, select the Gen2 firmware
> >     descriptor when present and attempt to load the corresponding
> >     firmware image.
> > 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
> >     descriptor is available, retry with the Gen1 firmware image.
> >
> > When a platform provides both Gen1 and Gen2 firmware descriptors and th=
e
> > firmware is loaded via a DT override, the driver detects the
> > firmware generation at runtime before authentication by inspecting
> > the firmware data. The firmware is classified as Gen2 if the
> > QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> > "video-firmware.N.M" format with N >=3D 2.
> >
> > If a Gen1 firmware image is detected in this case, the driver switches
> > to the Gen1 firmware descriptor and associated platform data so that
> > the correct HFI implementation is used.
> >
> > This change makes firmware generation detection platform=E2=80=91agnost=
ic,
> > preserves DT overrides, prefers newer Gen2 firmware when available,
> > and maintains compatibility with platforms that only support Gen1.
> >
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_core.c       |   2 +
> >   drivers/media/platform/qcom/iris/iris_firmware.c   | 146 ++++++++++++=
++++++---
> >   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
> >   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
> >   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
> >   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
> >   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
> >   7 files changed, 147 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/med=
ia/platform/qcom/iris/iris_core.c
> > index 52bf56e517f9..6dbe18be5b49 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.c
> > +++ b/drivers/media/platform/qcom/iris/iris_core.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/pm_runtime.h>
> >
> >   #include "iris_core.h"
> > +#include "iris_ctrls.h"
> >   #include "iris_firmware.h"
> >   #include "iris_state.h"
> >   #include "iris_vpu_common.h"
> > @@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
> >               goto error_unload_fw;
> >
> >       core->iris_firmware_data->init_hfi_ops(core);
> > +     iris_session_init_caps(core);
> >
> >       ret =3D iris_hfi_core_init(core);
> >       if (ret)
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers=
/media/platform/qcom/iris/iris_firmware.c
> > index 1a476146d758..a3aa41aa1e66 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -16,20 +16,138 @@
> >
> >   #define MAX_FIRMWARE_NAME_SIZE      128
> >
> > -static int iris_load_fw_to_memory(struct iris_core *core, const char *=
fw_name)
> > +/* Detect Gen2 firmware by scanning the blob for:
> > + *   QC_IMAGE_VERSION_STRING=3D<version>
> > + * and then checking:
> > + *   - version starts with "vfw", OR
> > + *   - version matches "video-firmware.N.M" with N >=3D 2
> > + */
> > +
> > +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> > +{
> > +     static const char *marker =3D "QC_IMAGE_VERSION_STRING=3D";
> > +     const size_t mlen =3D strlen(marker);
> > +     static const char *vfw =3D "vfw";
> > +     const size_t vfwlen =3D strlen(vfw);
> > +     static const char *vf =3D "video-firmware.";
> > +     const size_t vflen =3D strlen(vf);
> > +
> > +     for (size_t i =3D 0; i + mlen < size; i++) {
> > +             const char *found;
> > +
> > +             if (memcmp(data + i, marker, mlen))
> > +                     continue;
> > +
> > +             found =3D data + i + mlen;
> > +             size -=3D i + mlen;
> > +
> > +             /* vfw =3D> Gen2 */
> > +             if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> > +                     return true;
> > +
> > +             if (size < vflen ||
> > +                 memcmp(found, vf, vflen))
> > +                     return false;
> > +
> > +             found +=3D vflen;
> > +             size -=3D vflen;
> > +
> > +             /*
> > +              * video-firmware.1.x is Gen1.
> > +              * video-firmware.2.x and video-firmware.10.x are Gen2.
> > +              */
> > +             return size >=3D 2 &&
> > +                     (*found >=3D '2' || (*found =3D=3D '1' && found[1=
] !=3D '.'));
> > +     }
> > +
> > +     return false;
>
> The logic here is much easier to read for me thanks for updating it.

And there will be a next iteration, as we need to check the version
string after qcom_mdt_load() loads all data segments.

>
> > +}
> > +
> > +static const struct firmware *iris_detect_firmware(struct iris_core *c=
ore,
> > +                                                const char **fw_name)
> > +{
> > +     const struct iris_firmware_desc *desc;
> > +     const struct firmware *firmware;
> > +     bool has_both_gens;
> > +     int ret;
> > +
> > +     *fw_name =3D NULL;
> > +     ret =3D of_property_read_string_index(dev_of_node(core->dev), "fi=
rmware-name", 0, fw_name);
> > +
> > +     /*
> > +      * A platform may support both Gen1 and Gen2 firmware; which one =
is used
> > +      * depends on the firmware image installed on the system, not on =
the
> > +      * hardware. That installed image does not change while the devic=
e is
> > +      * bound, so detect the generation only once and reuse the chosen
> > +      * descriptor on later core bring-ups (e.g. after a system error
> > +      * recovery). Besides avoiding the redundant probing, this ensure=
s
> > +      * core->iris_firmware_desc and iris_firmware_data are published =
exactly
> > +      * once, before any session exists, so the lockless readers in th=
e ioctl
> > +      * paths never observe a reassignment.
> > +      */
> > +     if (core->iris_firmware_desc) {
> > +             if (ret)
> > +                     *fw_name =3D core->iris_firmware_desc->fwname;
> > +             ret =3D request_firmware(&firmware, *fw_name, core->dev);
> > +             return ret ? ERR_PTR(ret) : firmware;
> > +     }
> > +
> > +     has_both_gens =3D core->iris_platform_data->firmware_desc_gen2 &&
> > +             core->iris_platform_data->firmware_desc_gen1;
> > +
> > +     if (core->iris_platform_data->firmware_desc_gen2)
> > +             desc =3D core->iris_platform_data->firmware_desc_gen2;
> > +     else if (core->iris_platform_data->firmware_desc_gen1)
> > +             desc =3D core->iris_platform_data->firmware_desc_gen1;
> > +     else
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     if (ret) {
> > +             /* No firmware-name in DT: select by probing Gen2 then Ge=
n1. */
> > +             *fw_name =3D desc->fwname;
> > +             if (has_both_gens)
> > +                     ret =3D firmware_request_nowarn(&firmware, *fw_na=
me, core->dev);
> > +             else
> > +                     ret =3D request_firmware(&firmware, *fw_name, cor=
e->dev);
> > +             if (ret && has_both_gens) {
> > +                     desc =3D core->iris_platform_data->firmware_desc_=
gen1;
> > +                     *fw_name =3D desc->fwname;
> > +                     ret =3D request_firmware(&firmware, *fw_name, cor=
e->dev);
> > +             }
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +     } else {
> > +             /* firmware-name given: load it and detect its generation=
. */
> > +             ret =3D request_firmware(&firmware, *fw_name, core->dev);
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +
> > +             if (has_both_gens &&
> > +                 !iris_detect_gen2_from_fwdata((const u8 *)firmware->d=
ata, firmware->size)) {
>
> Is it really legitimate to parse the _entire_ firmware for this data -
> potentially megabytes ?
>
> Surely the first 4k or less of data is enough to know if a firmware
> string has been detected ?

I think we have discussed this already. No, it's not. The string is in
the middle of the image. 4k is just the ELF header and signatures.

>
> > +                     dev_info(core->dev, "Gen1 FW detected in %s\n", *=
fw_name);
> > +                     desc =3D core->iris_platform_data->firmware_desc_=
gen1;
> > +             }
> > +     }
> > +
> > +     /* Publish iris_firmware_data first, then iris_firmware_desc (the=
 guard). */
> > +     core->iris_firmware_data =3D desc->firmware_data;
> > +     core->iris_firmware_desc =3D desc;
> > +
> > +     return firmware;
> > +}
> > +
> > +static int iris_load_fw_to_memory(struct iris_core *core)
> >   {
> >       const struct firmware *firmware =3D NULL;
> >       struct device *dev =3D core->dev;
> >       struct resource res;
> >       phys_addr_t mem_phys;
> > +     const char *fw_name;
> >       size_t res_size;
> >       ssize_t fw_size;
> >       void *mem_virt;
> >       int ret;
> >
> > -     if (strlen(fw_name) >=3D MAX_FIRMWARE_NAME_SIZE - 4)
> > -             return -EINVAL;
> > -
> >       ret =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res)=
;
> >       if (ret)
> >               return ret;
> > @@ -37,9 +155,9 @@ static int iris_load_fw_to_memory(struct iris_core *=
core, const char *fw_name)
> >       mem_phys =3D res.start;
> >       res_size =3D resource_size(&res);
> >
> > -     ret =3D request_firmware(&firmware, fw_name, dev);
> > -     if (ret)
> > -             return ret;
> > +     firmware =3D iris_detect_firmware(core, &fw_name);
> > +     if (IS_ERR(firmware))
> > +             return PTR_ERR(firmware);
> >
> >       fw_size =3D qcom_mdt_get_size(firmware);
> >       if (fw_size < 0 || res_size < (size_t)fw_size) {
> > @@ -66,18 +184,12 @@ static int iris_load_fw_to_memory(struct iris_core=
 *core, const char *fw_name)
> >   int iris_fw_load(struct iris_core *core)
> >   {
> >       const struct tz_cp_config *cp_config;
> > -     const char *fwpath =3D NULL;
> >       int i, ret;
> >
> > -     ret =3D of_property_read_string_index(core->dev->of_node, "firmwa=
re-name", 0,
> > -                                         &fwpath);
> > -     if (ret)
> > -             fwpath =3D core->iris_firmware_desc->fwname;
> > -
> > -     ret =3D iris_load_fw_to_memory(core, fwpath);
> > +     ret =3D iris_load_fw_to_memory(core);
> >       if (ret) {
> > -             dev_err(core->dev, "firmware download failed\n");
> > -             return -ENOMEM;
> > +             dev_err(core->dev, "firmware download failed %d\n", ret);
> > +             return ret;
> >       }
> >
> >       ret =3D qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> > @@ -99,7 +211,7 @@ int iris_fw_load(struct iris_core *core)
> >               }
> >       }
> >
> > -     return ret;
> > +     return 0;
> >   }
> >
> >   int iris_fw_unload(struct iris_core *core)
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/=
drivers/media/platform/qcom/iris/iris_platform_common.h
> > index c9256f2323dc..55a4fa356985 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -289,11 +289,7 @@ struct iris_firmware_desc {
> >   };
> >
> >   struct iris_platform_data {
> > -     /*
> > -      * XXX: replace with gen1 / gen2 pointers once we have platforms
> > -      * supporting both firmware kinds.
> > -      */
> > -     const struct iris_firmware_desc *firmware_desc;
> > +     const struct iris_firmware_desc *firmware_desc_gen1, *firmware_de=
sc_gen2;
> >
> >       const struct vpu_ops *vpu_ops;
> >       const struct icc_info *icc_tbl;
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/dr=
ivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > index 6e06a32822bb..961dce2e6aa9 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > @@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1=
_gen1_desc =3D {
> >       .fwname =3D "qcom/vpu/vpu20_p1.mbn",
> >   };
> >
> > +static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc =3D =
{
> > +     .firmware_data =3D &iris_hfi_gen2_data,
> > +     .get_vpu_buffer_size =3D iris_vpu33_buf_size,
> > +     .fwname =3D "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> > +};
> > +
> >   static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc =3D {
> >       .firmware_data =3D &iris_hfi_gen1_data,
> >       .get_vpu_buffer_size =3D iris_vpu_buf_size,
> > @@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] =
=3D {
> >   };
> >
> >   const struct iris_platform_data sc7280_data =3D {
> > -     .firmware_desc =3D &iris_vpu20_p1_gen1_desc,
> > +     .firmware_desc_gen1 =3D &iris_vpu20_p1_gen1_desc,
> > +     .firmware_desc_gen2 =3D &iris_vpu20_p1_gen2_s6_desc,
> >       .vpu_ops =3D &iris_vpu2_ops,
> >       .icc_tbl =3D iris_icc_info_vpu2,
> >       .icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu2),
> > @@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data =3D {
> >   };
> >
> >   const struct iris_platform_data sm8250_data =3D {
> > -     .firmware_desc =3D &iris_vpu20_p4_gen1_desc,
> > +     .firmware_desc_gen1 =3D &iris_vpu20_p4_gen1_desc,
> >       .vpu_ops =3D &iris_vpu2_ops,
> >       .icc_tbl =3D iris_icc_info_vpu2,
> >       .icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu2),
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/d=
rivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> > index 2c63adbc5579..74626b35d9cb 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> > @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] =
=3D {
> >    * - inst_caps to platform_inst_cap_qcs8300
> >    */
> >   const struct iris_platform_data qcs8300_data =3D {
> > -     .firmware_desc =3D &iris_vpu30_p4_s6_gen2_desc,
> > +     .firmware_desc_gen2 =3D &iris_vpu30_p4_s6_gen2_desc,
> >       .vpu_ops =3D &iris_vpu3_ops,
> >       .icc_tbl =3D iris_icc_info_vpu3x,
> >       .icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu3x),
> > @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data =3D {
> >   };
> >
> >   const struct iris_platform_data sm8550_data =3D {
> > -     .firmware_desc =3D &iris_vpu30_p4_gen2_desc,
> > +     .firmware_desc_gen2 =3D &iris_vpu30_p4_gen2_desc,
> >       .vpu_ops =3D &iris_vpu3_ops,
> >       .icc_tbl =3D iris_icc_info_vpu3x,
> >       .icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu3x),
> > @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data =3D {
> >    * - controller_rst_tbl to sm8650_controller_reset_table
> >    */
> >   const struct iris_platform_data sm8650_data =3D {
> > -     .firmware_desc =3D &iris_vpu33_p4_gen2_desc,
> > +     .firmware_desc_gen2 =3D &iris_vpu33_p4_gen2_desc,
> >       .vpu_ops =3D &iris_vpu33_ops,
> >       .icc_tbl =3D iris_icc_info_vpu3x,
> >       .icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu3x),
> > @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data =3D {
> >   };
> >
> >   const struct iris_platform_data sm8750_data =3D {
> > -     .firmware_desc =3D &iris_vpu35_p4_gen2_desc,
> > +     .firmware_desc_gen2 =3D &iris_vpu35_p4_gen2_desc,
> >       .vpu_ops =3D &iris_vpu35_ops,
> >       .icc_tbl =3D iris_icc_info_vpu3x,
> >       .icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu3x),
> > @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data =3D {
> >    * - different num_vpp_pipe
> >    */
> >   const struct iris_platform_data x1p42100_data =3D {
> > -     .firmware_desc =3D &iris_vpu30_p1_gen2_desc,
> > +     .firmware_desc_gen2 =3D &iris_vpu30_p1_gen2_desc,
> >       .vpu_ops =3D &iris_vpu3_ops,
> >       .icc_tbl =3D iris_icc_info_vpu3x,
> >       .icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_vpu3x),
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/me=
dia/platform/qcom/iris/iris_probe.c
> > index c2dcb50a2782..7fe31136df21 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
> >               return core->irq;
> >
> >       core->iris_platform_data =3D of_device_get_match_data(core->dev);
> > -     core->iris_firmware_desc =3D core->iris_platform_data->firmware_d=
esc;
> > -     core->iris_firmware_data =3D core->iris_firmware_desc->firmware_d=
ata;
> >
> >       core->ubwc_cfg =3D qcom_ubwc_config_get_data();
> >       if (IS_ERR(core->ubwc_cfg))
> > @@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
> >       if (ret)
> >               return ret;
> >
> > -     iris_session_init_caps(core);
> > -
> >       ret =3D v4l2_device_register(dev, &core->v4l2_dev);
> >       if (ret)
> >               return ret;
> > diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/med=
ia/platform/qcom/iris/iris_vidc.c
> > index 14d63dc76c9b..33edbc5cab8f 100644
> > --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> > +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> > @@ -9,6 +9,7 @@
> >   #include <media/v4l2-mem2mem.h>
> >   #include <media/videobuf2-dma-contig.h>
> >
> > +#include "iris_ctrls.h"
> >   #include "iris_vidc.h"
> >   #include "iris_instance.h"
> >   #include "iris_vdec.h"
> >
> > --
> > 2.47.3
> >
> >
>


--=20
With best wishes
Dmitry
