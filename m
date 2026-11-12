Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496813;
	b=lz1DlrJxJP5RBJslopMTXBIuZAbRcwL1W/6ZWBqeUEwqwfx5rFPi+lHNUTKttiq1asC7
	 aC8hSIeAvJ109WGmVEFsnqG7UWj68B9w8X+fqel2uikciz8wCvgLrtFQFzFSdH1Ee5/S6
	 rpextvesyL+eVSZlCZnRu+7jAWCD/444O7Vhp9c9dGtektgn7jb7KRSGETIs4d8TElZ4P
	 BSr/p5AhFxHB6aGOdTRSS0f9hhBpBgeO+g1rPHKYYPNHWUfgfCkJAHQhMLO6tTQOe1HHv
	 elI+SyRjhtNpA8zS24bipsO5bLNQtJIqVm7pD/9WJjWXq+9MzdlBOB4gwx9weiYXUaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=;
	b=rC4U23wM8PS7tTgHJGqgZg1uj/Vjhvl3pjRtkhBE+sTJR03aqJlY9gNp45CrePvxc/cV
	 nZkl/k6nJcOmviWUfeLpjwCfrH/CIz00FAWKMIVcsEQ2GpFDxiRz5EOzzjZ7sbiZ7JhCY
	 nVcLU9fr5dvsB+eQAcFxsfWuA+MVTpJkV9Iw0KhecVMKWc1TPP/lKRDJwUWD7Y8pa6wsZ
	 sJgL8ffDjg9SRwrzxW/y+rWQyThqY/3Yz4189aep9hWQgUI5OG/H6LKo4DhNu62lshOmc
	 YANlGHrjyr9L8GIpruj3f5oJuJJIICii8x67ETWyiWQK4Y7FA795gemzuHEQKyliIUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=isZAzEjw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5saPnf+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D460A5BDA
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1D460A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=isZAzEjw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5saPnf+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBRNk53893074
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=; b=isZAzEjwKumlixI0
	DrwYp7TSLWkN+oTpA9eciLdB3BssYhOhb9HwJJUnPhBVY01KxJ3eKN4hX2twziJZ
	x8P9jVovz/sKgkPv0rV1wlHtnkNplB7rO4NcSlV3LMffdwvPjNwzm6MV8LZP7gfh
	YfS8REewWUI44q74Z70Ezm03vlQj+dGd7hN/pjkyULkNAaONC0hAvr+6Oa0gLXaO
	S9RkwJaZxFyL8XF+0NPJW6/cvjbijKcxZd0kHVjRSFrE1RRLX58xv9aSUXkwbRPQ
	CdA61J0XbkRSTZGgDa1U7j7yN/6QmkunQwYPuk8FDnrETXWCYUstOLf2E6/YuDKS
	tivIWw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re26t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:20:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so4120519b3a.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496812; cv=none;
        d=google.com; s=arc-20260327;
        b=dMes+k+IaUH0LbviZGOjI7LHGwzzAcV58i1yplV8h3PHsCpFubuETwFQfJfJI4nqkI
         cUNS3PLv1oSVhwF2jsTfNuVQs69ww2ZigrM+Sq8oUYN1kNbiGUUMWgA9QLKV9sjICsbh
         5/TNGn5Jp2cxn/Ze9R2szTjM7TTuc1b7VXiw2AhS8+fafwgIAl741lFUxq1cH4sz7RLZ
         siIAPCbZ26yXG70YQi1vKRyBwvQltM2JSGje/dGr4nRN4sSASjMAV8YQHTj3Q4qKLU0N
         7hG/db/eTpF0GqEeSXWWMlbbMJuA4sPKPOSHfhh9DSyx5+ki8RdothhPwBZhK19eh/pV
         bptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=;
        fh=Hu+htxam56Bh4gg6GW2sU1gopNpfwMmhA4wMMsHAySU=;
        b=OAM0wRE8/RnfIUscY8iBOOCC6gvo8By3RtTsYispIbhvCq8bTIsuhVFFgdIff1GCz5
         a2YAqr/OWhkr4h4hTPAHWQ2Z995CzsNcd4mkYRp1Xt7oJw2SoUugTBcychZLSc0QpdXQ
         bzv5aHtoiXEf/30mh1eKvVlyFFW4pgL5y6TbQlLIs947zKEJpXxnKJXyK/0uzFYDJfG5
         EYylFPs4l8BCdBJ/rCaTMNsVw9IZVKLHCFFqZDnhE3XxGAh8Uk7jAcj6j7Zu9GSJ+mzF
         qYQkixIlKKOhsB6l3teSiLkIAPydzLzrf+D7xfeTrv0J9Nde00Vivuj2YuB6h30n4SCB
         Pt6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794496812; x=1795101612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=;
        b=R5saPnf+jm6EdiBLRiNvTzZ8pZbQphbAa7z/JTzbXB47wo+2C29ij2bsSMTM1re7l+
         IjA/fqrxOiPZgIGUTTWzYrJidgBjZaWsUCPfWqTdMRRVahkE+z0T9W98qxD/FhmMJcu/
         ayQRBm2M+ovaxnC1vERltEB3d8JFzA11XJZeUz8dQlm+rIODZLp325shdNgL7PZXonKn
         ruCgPlRmUAEXKSCnIh2N2wDatcDfRNecBzfCuoQiG3ClMRvFzxU9MIDGIaeyBksGCcf/
         LXk/tV7PxT6hjeH+Tc1/jdS7DPZt1LR2rURjzrGJfClUx7tLvH44PDLDep0ZcS7dNgOf
         uqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496812; x=1795101612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=;
        b=fHitqJ/R5Ge/zJaBN7iP6eqZku8QRIvgw2I7QZpeAQ34WqK+MO9clzbjMQVJC+ts6F
         ZVD8sM4iEI0eWhj/dEFDbnOdDTdnL3VvhqZczhaOfXxHyGeT+caGPbzxuW2LnpH48WlU
         LErizYpinPDl0oi2RVG18EsJUwnzpN9lRIt5EZlBx676Nw1L+4bv/zJ0QGfEP8LvaYxy
         lIHfJ0BLp4tU4Ta1xUrVDP85JCwxeLUCdlrnP/O2aacOBhtBqXQcCs53DQue3xz4noNw
         sgEbwctMQjav5SWqmITmSft21CAjespG9Nt4dEsCiTveUCIFHdtMOshWPsvHd0pWOZPD
         R+FA==
X-Forwarded-Encrypted: i=1; AL+hErGPP/aboz5gyYCH0ZnEibGysiXYwcyOD4fltl5CqmEr8wPJIu4pVtkg882k6rDzOho/oXh6shHE3QsC@vger.kernel.org
X-Gm-Message-State: APuU4Z/SpYC4HpsjoMNZhGtwwGtefO+6/pcKFRsHsB6oN1sGSTEAH74Z
	Y/iwx8rkEDiHrajzNg2A8J0MVa60lae5ZWcXTwT4h4mjgH3UyTSe59Pvjm5f+6lIKWD2PVpEIQD
	YAiM8pKLZpYj56yIY4F3u02x5yIT9kcrvP9HvIPNrF75FVMEJRuibA9YyHW2sgywUwvl3UODgeK
	jHrM3i8thWM7AZbI9zmNyPRXLINvmVggRkmCKHoOU=
X-Gm-Gg: AYBFou2BjsTVQqY79vLLox/yrdD4r+PQIkPuVoMuVBOYRxtmomBErObo4b3XQ/ui7td
	EunB8mNeb0nVMRvRApO884q1E2wA4zVdjT4nhMEj8ZPXLJZ3TRytIKh7f6QbUdgz+TeKTN5tL/t
	4lDukPNq70WdcDbp4tIsd0FU6PBJhuzQxPZpJThHeZWyxAkJzGgy+yXyLVQA==
X-Received: by 2002:a05:6a00:f8d:b0:886:3a6c:a9da with SMTP id d2e1a72fcca58-8bc1bcd60d1mr5466842b3a.26.1794496811717;
        Thu, 12 Nov 2026 07:20:11 -0800 (PST)
X-Received: by 2002:a05:6a00:f8d:b0:886:3a6c:a9da with SMTP id
 d2e1a72fcca58-8bc1bcd60d1mr5466739b3a.26.1794496810109; Thu, 12 Nov 2026
 07:20:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019092417.391522-1-leonard@lausen.nl> <20261019092417.391522-2-leonard@lausen.nl>
In-Reply-To: <20261019092417.391522-2-leonard@lausen.nl>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:19:58 +0100
X-Gm-Features: AclHuK9honMV6OwgXNyYrNEkyUm1bD_efoW1xKgxLOXh4P3goN8MpuuCosIlMxs
Message-ID: <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain supply
To: Leonard Lausen <leonard@lausen.nl>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, detlev.casanova@collabora.com,
        finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
        inindev@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, gahing@gahingwoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: W7DjQrKeFZnOjw9seFt2YPowVi8WD0nO
X-Proofpoint-GUID: W7DjQrKeFZnOjw9seFt2YPowVi8WD0nO
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5d92c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=9GNsruGHAAAA:8 a=TNRU4YkNAAAA:8
 a=9z9mmZE1JoB7TLlessoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=gf-oSkQAjqHFJRp-GQfY:22 a=T6RL-YpNOstmnv1gjOTq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MSBTYWx0ZWRfX0BQmomIZIJIH
 3oE/qt2AKSUS7qDTJp8sJ71AsRuWe5bbouWkMJORf7OPAST2E1PURSfizxR2Sw1irDJxk2FmH+2
 vUdGi/6vl9Jb2/PB/e9HC0HcGDpG6ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MSBTYWx0ZWRfX7BZS1oiuYXTq
 SmtvfYlQw0rM7qduQdyUnaYLwztw/4R71GHp9031RMZLjya7SG99TAOG3q2Tk+LHZil7rMyHwOD
 4B/HGQmTulBP9DWGHGK783oq+XAqMlAg2bfoNK+K6Af+b4IR3DGnWSKK1Qsszx00znQHenY35lz
 RyYh7Vlfb0omSGiv2d4DWrL9G309UgBb7ibsf+04+RxbCMeDaTeO5ZonqmSMlTQ7GwmvbLVzMf8
 9iF4cCoTnFQBCQVjgXhSSXJD5oT/Sp9Q2BEY/qjby9clVl5kFC5N9mjkQfWvbU6JMUGpGCv91/B
 eR2NZ7CaWqATylPZts/tX/dojU4G37SuquZ8YypNF5wHL9K9wpUhN9+raR6ozYDu941wg41VuOr
 3YotTyDOijrs13C5A58GRWp+Ev4FWFgaxNcmPoMOqSdPIWAgBOsiAPk1F2LoE2lVllcBfh8Q02m
 MFcgrDgsuY4of08ZFDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120061

On Mon, Oct 19, 2026 at 11:24=E2=80=AFAM Leonard Lausen <leonard@lausen.nl>=
 wrote:
>
> On the NanoPi M5, boot hangs during Panfrost initialization. Before this
> fix, booting required blacklisting Panfrost on the kernel command line.
> Loading Panfrost after boot reports a GPU power-domain acknowledgment
> timeout:
>
>   failed to get ack on domain 'gpu', val=3D0x113ff
>
> Add regulator support to the RK3576 domain descriptors and mark the GPU
> domain as regulator-dependent. This lets the existing Rockchip
> power-domain regulator handling manage the GPU domain supply.
>
> A corresponding domain-supply property is needed in the board DT.
>
> The regulator-capable descriptors are based on the regulator support in
> Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU settle
> delay changes.
>
> Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahingwo=
o.com/
> Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>

So this should be applied as a fix and tagged for stable kernels, right?

Kind regards
Uffe

>
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e193f978d5f35..b41f9fcb62bfe 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -176,41 +176,42 @@ struct rockchip_pmu {
>         .mem_offset =3D m_offset,                         \
>         .mem_status_mask =3D (m_status),                  \
>         .repair_status_mask =3D (r_status),               \
>         .req_offset =3D r_offset,                         \
>         .req_w_mask =3D (req) << 16,                      \
>         .req_mask =3D (req),                              \
>         .idle_mask =3D (idle),                            \
>         .ack_mask =3D (ack),                              \
>         .active_wakeup =3D wakeup,                        \
>         .need_regulator =3D regulator,                    \
>  }
>
> -#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup)   \
> +#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup, regulator)        \
>  {                                                      \
>         .name =3D _name,                                  \
>         .pwr_offset =3D p_offset,                         \
>         .pwr_w_mask =3D (pwr) << 16,                      \
>         .pwr_mask =3D (pwr),                              \
>         .status_mask =3D (status),                        \
>         .mem_offset =3D m_offset,                         \
>         .mem_status_mask =3D (m_status),                  \
>         .repair_status_mask =3D (r_status),               \
>         .req_offset =3D r_offset,                         \
>         .req_w_mask =3D (req) << 16,                      \
>         .req_mask =3D (req),                              \
>         .idle_mask =3D (idle),                            \
>         .clk_ungate_mask =3D (g_mask),                    \
>         .ack_mask =3D (ack),                              \
>         .active_wakeup =3D wakeup,                        \
> +       .need_regulator =3D regulator,                    \
>  }
>
>  #define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)      \
>  {                                                      \
>         .name =3D _name,                          \
>         .pwr_w_mask =3D (pwr) << 16,                      \
>         .pwr_mask =3D (pwr),                              \
>         .status_mask =3D (status),                        \
>         .req_w_mask =3D (req) << 16,                      \
>         .req_mask =3D (req),                              \
>         .idle_mask =3D (idle),                            \
>         .ack_mask =3D (ack),                              \
> @@ -250,25 +251,28 @@ struct rockchip_pmu {
>         DOMAIN(name, pwr, status, req, req, req, wakeup)
>
>  #define DOMAIN_RK3528(name, pwr, req)          \
>         DOMAIN_M(name, pwr, pwr, req, req, req, false)
>
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
>         DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup,=
 false)
>
>  #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)               \
>         DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
>
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)      \
> -       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup)
> +       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup, false)
> +
> +#define DOMAIN_RK3576_R(name, p_offset, pwr, status, r_status, r_offset,=
 req, idle, g_mask, wakeup)    \
> +       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup, true)
>
>  /*
>   * Dynamic Memory Controller may need to coordinate with us -- see
>   * rockchip_pmu_block().
>   *
>   * dmc_pmu_mutex protects registration-time races, so DMC driver doesn't=
 try to
>   * block() while we're initializing the PMU.
>   */
>  static DEFINE_MUTEX(dmc_pmu_mutex);
>  static struct rockchip_pmu *dmc_pmu;
>
>  /*
> @@ -1323,25 +1327,25 @@ static const struct rockchip_domain_info rk3576_p=
m_domains[] =3D {
>         [RK3576_PD_VOP]         =3D DOMAIN_RK3576("vop",    0x0, BIT(11),=
 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  false),
>         [RK3576_PD_VO1]         =3D DOMAIN_RK3576("vo1",    0x0, BIT(14),=
 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  false),
>         [RK3576_PD_VO0]         =3D DOMAIN_RK3576("vo0",    0x0, BIT(15),=
 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  false),
>         [RK3576_PD_USB]         =3D DOMAIN_RK3576("usb",    0x4, BIT(0), =
 0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  true),
>         [RK3576_PD_VI]          =3D DOMAIN_RK3576("vi",     0x4, BIT(1), =
 0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
>         [RK3576_PD_VEPU0]       =3D DOMAIN_RK3576("vepu0",  0x4, BIT(2), =
 0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
>         [RK3576_PD_VEPU1]       =3D DOMAIN_RK3576("vepu1",  0x4, BIT(3), =
 0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
>         [RK3576_PD_VDEC]        =3D DOMAIN_RK3576("vdec",   0x4, BIT(4), =
 0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
>         [RK3576_PD_VPU]         =3D DOMAIN_RK3576("vpu",    0x4, BIT(5), =
 0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
>         [RK3576_PD_NPUTOP]      =3D DOMAIN_RK3576("nputop", 0x4, BIT(6), =
 0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    false),
>         [RK3576_PD_NPU0]        =3D DOMAIN_RK3576("npu0",   0x4, BIT(7), =
 0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
>         [RK3576_PD_NPU1]        =3D DOMAIN_RK3576("npu1",   0x4, BIT(8), =
 0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
> -       [RK3576_PD_GPU]         =3D DOMAIN_RK3576("gpu",    0x4, BIT(9), =
 0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
> +       [RK3576_PD_GPU]         =3D DOMAIN_RK3576_R("gpu",  0x4, BIT(9), =
 0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
>  };
>
>  static const struct rockchip_domain_info rk3588_pm_domains[] =3D {
>         [RK3588_PD_GPU]         =3D DOMAIN_RK3588("gpu",     0x0, BIT(0),=
  0,       0x0, 0,       BIT(1),  0x0, BIT(0),  BIT(0),  false, true),
>         [RK3588_PD_NPU]         =3D DOMAIN_RK3588("npu",     0x0, BIT(1),=
  BIT(1),  0x0, 0,       0,       0x0, 0,       0,       false, true),
>         [RK3588_PD_VCODEC]      =3D DOMAIN_RK3588("vcodec",  0x0, BIT(2),=
  BIT(2),  0x0, 0,       0,       0x0, 0,       0,       false, true),
>         [RK3588_PD_NPUTOP]      =3D DOMAIN_RK3588("nputop",  0x0, BIT(3),=
  0,       0x0, BIT(11), BIT(2),  0x0, BIT(1),  BIT(1),  false, false),
>         [RK3588_PD_NPU1]        =3D DOMAIN_RK3588("npu1",    0x0, BIT(4),=
  0,       0x0, BIT(12), BIT(3),  0x0, BIT(2),  BIT(2),  false, false),
>         [RK3588_PD_NPU2]        =3D DOMAIN_RK3588("npu2",    0x0, BIT(5),=
  0,       0x0, BIT(13), BIT(4),  0x0, BIT(3),  BIT(3),  false, false),
>         [RK3588_PD_VENC0]       =3D DOMAIN_RK3588("venc0",   0x0, BIT(6),=
  0,       0x0, BIT(14), BIT(5),  0x0, BIT(4),  BIT(4),  false, false),
>         [RK3588_PD_VENC1]       =3D DOMAIN_RK3588("venc1",   0x0, BIT(7),=
  0,       0x0, BIT(15), BIT(6),  0x0, BIT(5),  BIT(5),  false, false),
>         [RK3588_PD_RKVDEC0]     =3D DOMAIN_RK3588("rkvdec0", 0x0, BIT(8),=
  0,       0x0, BIT(16), BIT(7),  0x0, BIT(6),  BIT(6),  false, false),
> --
> 2.47.3
>
