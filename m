Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D7B336895
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024287; cv=pass; b=fBvwqKNH2xItO4sQPsk+6xEI+iYJcVidwxWVlIropm03m5u972yZwh2VtpUPiNK6TFSACXq6P4JoKN+rgglJpNbhZUhLIS/nvWAVuS8Znmb4xyuhX0FtUju97nzY01wsyhKgTe/sfMmjWLBd3lWYrf+dY+K+FXNg8AaLqXMF++k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024287; c=relaxed/simple;
	bh=IE7I7VDhYo0gcnWqMTBTWczlzaHH4n4GnuvfYzS9las=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6y9FXkpIRT5wj/wh/LVk57MxflPXJIVIwhaxhvQXieZT/Gmjy9Io5mmwNdaVnXK2V1dA4Ym80L6uuz2IjOWQ2kWF+8R1nDAOGZTrGPx2Sntv3VzH17IcXEZqymC5BkLUwZ3sKS/sYLYDyhZrRBt9Rwf4ubQc/jp3SLVx9klhA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMU0vD9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T381WuJo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMU0vD9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T381WuJo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gd74162283
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=; b=NMU0vD9QYCqz7Kaq
	sfKMCQHP1p550Gj1xDn13LdJvw/Vt59oX0tgJqTJFXK/VMHc0Lkvsxb/LZEqXAom
	bB2PyuTQZlndRdMXVUj+7GczFRRqhQDb3ixRv1UlCws3NS9ufy+BXV0MzUlvdYzt
	Ylx8OBwRBZ2wBm2uv08w+kVE6pjWkbZeStGDSLGsJU8vpTJBFX2bY3a4Kzf9z9Gd
	byeu8Jv9dEoow04yKl3CzEh+jPpblbvFd5XRXlWZCGqi+qrPiinXR9FiozheUE3D
	GONvETAIDnZi2grvDNIveRzFj5py27OeB8sTPmazllaUlVf791LVKROlazdBIVTa
	w7wxzw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2ms0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:11:23 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66988049306so8932880d50.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024283; cv=none;
        d=google.com; s=arc-20260327;
        b=GalBRHjiF1gWGV+bi+jFU9NnGWVn3mHPVX8EjXYcWiCqoQXKF60HfIRm2uQ9yr0fxn
         bQjMkEt0o3wvxCQO2JVKVUlFHHz36tC3dK25RdQMEvP7ThUWA9C2gUGhH0oYcq759vwN
         YqLJaPGySeR1wSiZR3Dz9CSDphYXqjf6LSm66ih58iLJZcO72nfE+Ak5t1s2Fojmfn0A
         ZvYtT29ThFInf5W5aR9pCvPdYH+FXzKgznOXuYgEV5UGsfPMeFi6yNt8mfVEI0SeViMh
         zz4ClxZi3/mdSYYEW+VRPzlQrFE1hbeGybRp7WW+pDX57ln7sqR0lR66mE1y6AKhIRR7
         +WFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        fh=Q6KN1bCRU8k9D98mHjOZnqryFsjAcdOrV5tG+4WcK1s=;
        b=UJ9NyJSxeYqiH+Okz9aLcxsZJkYhAn+Gktovp23iGNwZsPbQ/2CG8gNiOooQv9V0RB
         2gh7BbeO1VyJFjvE9jSNfWcCLrEt+6ovgj12ugsJ7yoOePAq89Y135SUswv+wQk5wG6k
         Ey6AxzMxzlgIuPBduCWCSw8iTkr2Q5UT/wRkb3FZ8J3/BGmyJ6PpTnUoUSOrt/Y+dlhC
         Uhvl9oZZDZ8kCuGBF7PClG2vGGsrH1NHy8dLlSz+Q17+ruPMNzhNLzSA8Vj/R+49CXJF
         qFjQjbnJt4hHcHpMVth8ngC2gw2KZGysWdBZnrPhSelDmmTecqb7hpuQASGGjfvkYThi
         G0ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789024283; x=1789629083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        b=T381WuJoc7WERUnFOAXhojgSNlIBLAG4WMk6Lbg6vbCuRTcGYWfE2s1JicxcIuaWl4
         06wMmdRiD60ZjJKIqevGq13SIec01C5soHSbL8FcfSIm0FQqI6bnfsr/lLLK85h6hXUD
         TWljsKigIKFk6i/GLFsQTR9SibXtLpoIAxdqEWX1IW1AdW3c02qrYyjNH91XR6K3oSmI
         CFbkc7BSOvkkt5+53dLmAE9z744dXeQkAjLcfOQ4myljufZv/rwaBaIuWCdgX0PP15fD
         rTUvHGeNUKDDDuZyqH35q2M8KJ9hbKLYl2Qw15EFYzFGQz9J+qhIvWPsIb3ICWf2cbUD
         9Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024283; x=1789629083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        b=o+mG5PpjJ8gg1USzExeUqCRSYA9HR2o4XM8iBycNkGG2tH99ejcufF4XsI4VXqkXPh
         BaxbhUdU7jeTqhsoWh+AEm6Ln47Yw+rvJ8+nLWkru893fyeS11+pJ5M98aKhm2fGT9n2
         ICA6/yfP4yc8lvkK8d9gx7IhCoRR7e4n0y3fPGL/JAby3JRGsLhoFISmdOOwzh/CvYZ4
         h7KRzcWftHv9PDSgYdw33UleqWTl1wnvGceA9OEMAMfD943sEAyy3v6J/tdTR+9pEIDc
         9KlLgaVaJ0TlfNm9yJTMN59ToGY7B3KEZueQy+o2OzrH5yTw9LflCDUskUazoc0zIoDD
         TEgQ==
X-Forwarded-Encrypted: i=1; AKwUvByTPH8funyHDc2VEmGQ2X4oTb1wFAQLxwKvb3xD4KGLC8Vpq+b0F95O1VLj5gIZgusGfZ5O69OTMcNv@vger.kernel.org
X-Gm-Message-State: AFuF++nAjfpNmrrd+shb57EJIPoEOa/zlWt397koLoLjzkCEgPeLUvjW
	VaLw2AIgftDyanTAjtYgmzoxNFak6JChd9MDzRA3b2tzkYLYOT4QYDuaHoAbU2fJfsEchfz69Pn
	ARjV4cvb8V1VLaaPNmfLscvvt7tfdHbdczq/3VmRLyTv7k/0qeOuzJns8RNJ9bdbI1NBf20lxMy
	RFJnLVo3J3CgwQ9AG5AxAIS8+WtC4oA5WtIFiSFSq9cgWglvU=
X-Gm-Gg: AYBFou0U9KbYmGnldipawhGsM6YOGvyUGDZLWsk4670Qu1Om2OEbzOFaPT83mHTFJS6
	G9uc1W+SCkQBrAoMCNPFBx+Y6t9H8iGQ4eVgZBEo2QDejL6zoWhmSDbep16GHRroogbZ4o9zCgY
	PZkvAkpO28yvCCOu0iKk9YyuHctSVwv9wjUXzVgdd2MH6b4lOuhrBT3Yt6DQ==
X-Received: by 2002:a05:690e:d41:b0:66f:a1e3:9c77 with SMTP id 956f58d0204a3-66fb58f831emr13555595d50.2.1789024283203;
        Thu, 10 Sep 2026 00:11:23 -0700 (PDT)
X-Received: by 2002:a05:690e:d41:b0:66f:a1e3:9c77 with SMTP id
 956f58d0204a3-66fb58f831emr13555588d50.2.1789024282836; Thu, 10 Sep 2026
 00:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com> <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:41:11 +0530
X-Gm-Features: AcwNN1UuJZypSHdyHXzQ4_kU6RGI9Uveem3lDvNPyuz26jeLuRfYKMB_4uImEoo
Message-ID: <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2581b cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=jaA2rcG_eHD-4mjPCPoA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: DU6nM7UkNKsRs4DnvybsQIqUtq9jFjfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3NyBTYWx0ZWRfX8xbhp+KxiKlB
 TLbKvSh7fdhPHc2pbJ6XPNJvcCeTMgwbg+DbG2LANtrx4xRZDNlADhHvzt5i0jtYlWmZ/yrnK/n
 x6hk+BryEuJZb+0LB9dW+m85IhhTfybOMChORr7VjUdJTLUYNYk9fSuxFHDJr3GpzvAwGg21T6k
 N/6O78ltsUsiU+gu75hYiQeebINz99zx9FYysgQK34O0LlLxdxXiELfiQLXmsZ8Gsm0HCp4Qa31
 SVgvglCwHm72+6TTquCFasIzrX4vhqoUw+t/r1l7cyde007agz0aXRtvujRezpyzbyso3xR63IV
 7B0iExNF+vaYz5TLYL5qLzLlrX3rbsAq+WdSwvhh/Q7+XnWJsH67/8S5065y/ONciA+XYenZX29
 vWWuC2MeEvvvwteUp5qBZZASIQEoOjoga6rRvXicdUMDIOsNSGg0GXlQmhDNWl+3hsqI3qxDTmt
 /6f2IFKd6Ox7pYNVJ2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3NyBTYWx0ZWRfX2C4ZMDIWH6PJ
 cndnuTZdygNnkEECDDDDTkwmJr0SbqHWRArjmmJImQiNEJhHL2w7fbGuR8DENvHTh58WtQAUpWW
 HOK7rH5VptNGiXLqeD5hSncpq/VfYQs=
X-Proofpoint-ORIG-GUID: DU6nM7UkNKsRs4DnvybsQIqUtq9jFjfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100077

Hey Folks,

On Mon, Jul 13, 2026 at 9:38=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on these devices [1].
>
> When running under Gunyah, remote processor firmware IOMMU streams are
> controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> Linux running at EL2. Describe the firmware streams for each
> remote processor in an EL2 overlay.
>
> Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
> devices to produce a -el2.dtb alongside the standard dtb. Modem and
> media subsystems are not yet supported due to missing dependencies.
> The GPU zap shader is disabled. In EL2 mode the kernel owns the
> hardware watchdog, so it is enabled here. The wifi-firmware child
> node describes the IOMMU stream for the WCN6750 firmware; the &wifi
> node itself is left untouched so that platforms without WiFi are
> unaffected by the overlay.
>
> [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boo=
t-developer-touchpoints.html#uefi
>
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>

Any updates on this patch if this can be picked up for the next merge windo=
w?

-Sumit

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 1c857bd7991b..22076579a50f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs     :=3D purwa-iot-evk.dtb x1=
-el2.dtbo
>
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D purwa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-fairphone-fp5.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp.dtb
> +qcm6490-idp-el2-dtbs :=3D qcm6490-idp.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp-el2.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-particle-tachyon.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs404-evb-1000.dtb
> @@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs :=3D qcs615-ride.dtb talos-el2=
.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs615-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs :=3D qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-el2.dtb
>
>  qcs6490-rb3gen2-vision-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs6490-r=
b3gen2-vision-mezzanine.dtbo
>  qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs64=
90-rb3gen2-industrial-mezzanine.dtbo
>
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-industrial-mezzanine=
.dtb
> +qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs :=3D qcs6490-rb3gen2-indus=
trial-mezzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-industrial-mezzanine=
-el2.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-vision-mezzanine.dtb
> +qcs6490-rb3gen2-vision-mezzanine-el2-dtbs :=3D qcs6490-rb3gen2-vision-me=
zzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-vision-mezzanine-el2=
.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-thundercomm-minipc-g1iot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-thundercomm-rubikpi3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs8300-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/d=
ts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..8daf7f02fd75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +       status =3D "disabled";
> +};
> +
> +&remoteproc_adsp {
> +       iommus =3D <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +       iommus =3D <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_mpss {
> +       status =3D "disabled";
> +};
> +
> +&venus {
> +       status =3D "disabled";
> +};
> +
> +&watchdog {
> +       status =3D "okay";
> +};
> +
> +&wifi {
> +       wifi-firmware {
> +               iommus =3D <&apps_smmu 0x1c02 0x1>;
> +       };
> +};
> --
> 2.53.0
>
