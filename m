Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5038F95B
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368996; cv=pass; b=dCjVVl1KBihAqc28UaGtHpUxfBEOakctEH+q9+49Dyaps7MUZPltAmkdIfsPrrc6lCPFm4fp+SJfQMY9CW2yLlRdr8W90e26qOo6saDes+NShiHblymkw3z+CCNO8m5Yq7MrJKftbdMZ8cVBwYuMnvgM4odDTcMax9yiFoRS/tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368996; c=relaxed/simple;
	bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIWqruz23OIN0Dsmc4i761VyL+EUF2paLI0J57LmmR71L5V89BDL7p84Fds0vxcrjq1slUxKySn9AXLXsu4ZGyz94z6HO/An9m1Bq78Z3V92j+KbAiEtMJm60EVgu0Rm4deVK77rAReBft9fZrMhatMhwsnxZdDA125OXZrBW+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sf+1OD7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOvENNgn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf+1OD7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOvENNgn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OFU3VV3903752
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=; b=Sf+1OD7d2Tp9RKS6
	F2xueAxJawlJ3sO3X96HAzDwTNMTARGUuzZTq5GhmyvvEh/F2rw0Go0t+c7IFCKn
	dThhlVH0MLxq6IuLTANDXEH95InmbIkg36BgtFCQ+HeDxTMPK92VZmdIiAI8NE/t
	VnbsGpmXaBAzlmZbQkySow6i1YSjr4gq3Pi9Z17kUqvSZw3sliCkh7f5LJdx78BD
	Xw7PuZZAl65UT3q4xy7Z3QPASW3QoMQ46VrKH1f185qU5tmfwq05cwAjy2mSBSnf
	Hx94FHHGaCKVyuD6Xu/o1PDKrsSEYiCyd59g9JUJk7PckbbNl5pIz/sn8fhW7oWQ
	rVRb4A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0jtd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:16:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89463017976so297565206d6.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774368994; cv=none;
        d=google.com; s=arc-20240605;
        b=ApGm3B49lV+/1Sw46ZafdBzqoUIYeQyW61HyOftVx6dTGTDPBv8yTc8eap49jrzbre
         HAFYSSNHk7wpTcmhngFkTht5f1dQPhT7f+c/DI+NbeFqQrKo/8u6zpF3TaXpb6kwrQq1
         3SOHTTZBrqfd8ImzWWrvWSLvwWTNqmje9u2LjQrMf7lnHuWptmsAtN+T1Jpt+Tqrhj/m
         s0UTI2bl2Y/jpnf/E5h3v33l07WwTbuFTCb/YaccSmMjqg6uyf6eNjOnIFTvUAj4iVC1
         TbBIoRws32uecggFNTXaaERu1tzbY9SEz/RofkuKfTd0gVoybVc0QDAUUy2In4ioU9LA
         +o8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        fh=VA1gggQq5ts5jsTcxrYIf5a12Inwiy4TJ50DrkyLH3M=;
        b=fPqtXHRHbSa+KGWTzlAD/tABXbBFiNs7Zp1vfzOdLqLiGZumy/OJxTZHjrylp1Ekky
         NZQI0+5dTCmipc3syHaCeBRjHAXYUqvuyR05wF4eyyG80ieqphSnpDvoislUd93MK69c
         CkRkdDW3iZ1ggbTKyAU7SPM1K5tyACn8LDMAx9M1YwgeLsvkkSdhACnjNarUhnWFuovw
         SCf6vA18XskdeQfhfjmoSB/urS0BDfGIJU72rRlZciv+BdInpuISJzDrJhvVJ7w+NZMl
         8+B5YfV18ZaqnzNhml5BzAn95lSRVhRsK1ECs8+kCmGWX6d5jkEeb2PJMu+73YSqZ+CD
         i7DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774368994; x=1774973794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        b=JOvENNgnwtqu5vHjno3XpcWfdwD0PehV5BMnnkzeo/AY6h4JSBiDP/RvybM5vx6XNm
         TPunbZjSykhKyrBAAmd8Fse4HNTbt4KuNLMy1p2BahH97reVLAuv1Vzmjz3Vh/+uXaqj
         4X7g2sX7rOvWlk4EizyUMdd6Nbj+Wa6uXQk2qfsCysad0WpGZYOaA24M4hrUufF8CqIN
         7tQHnJLl0jN/EepCajwn/LTO7Cqf8quIuVxEkx/5Eroeh8y8r9JyrOztaPn1JXa0ZhIW
         oM6jIwNr2fIdBYVGgyODKG/T1KPqrsM5k9prX29wK2FtKdjwvihwgQKg3EJv7n3HiqVi
         PbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368994; x=1774973794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        b=CulagK62ZlRuWxxlJjM6ibcZK1KsczjNrVoaA7NocduNZshgGMSDRWDYTnrDIzpoeA
         9pEzL5QiFyrjvOUGnGYCeIUbpilvG/VWvFNdg7SnUmYFXQ3vtYdJcymqJ9hGZnXOx7kt
         i6KiIwGaOLPwzHextSQerNzCBQ6yVNPDAREbVn1U2qnrcLMZYpASjuWYq5McftzG5Djq
         RU5xYXuW8AKY8AGECSLWkNfwFv1HzF8SqDuPPYSJJQsAItYh0/ySX7i7GHvxvorMJ23X
         PZcEU+CCXd0IYu49ydn2AARSRr5rzhExHp7Q0fRT33SVLiE0bunirhEEoEfQ/++bA3AJ
         UywQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZCpteI9vESbh3pnyKAJy9WRLr/0s1GQgMW53RZbk80NaDCgeP8W9xc0XQ8XfyRp+y4bpoxhUwYeSt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75/pJT8OzH9mgc0xvEjtsqxJ1Fu0yHmcqJ/95FNd3tEt6FwX+
	Ijw8KtpwUzRw3A4+8bg6+HGG+NOP/p9y8pajcLXUvdjYr3fPNPHHAJfWcwumxegvs9DXhjQbQQK
	tumJaFjkRArZLrjivq72q86sLOApDbZbIHUD7Tm3q1usAgaFOP9wabFLcokKnXXXEu/AsaaA34Y
	2IPxgR7QJ5xvUu4YOHhw5QgpEW2Zq6XDdD8iHYDx0=
X-Gm-Gg: ATEYQzzrnXcOEzu6PRbI5B0l+1e5FE3aEk4qcwlTrji9Vt6dPOi8FHscSadkjxRY/u/
	Z4DA/xhQHRdq/T/SZSoAZ4VfYT/atDkIafxonaErl0VJB+8RBg/mqcWKzdthcHTWPpFSa3th4OJ
	nwM0DmJWOzvkGB72CrJhdJydGgFxghqhBvfrTQYfyBqXJzx8xXtdIQx8vQ0hTTyXeVcOPLdfc9R
	FzMCkVY0WJ392qlxQWVubxqgekxq1FPWo+erpgS1kchNk4KfBNSl40+mhZAnaM1BSXK
X-Received: by 2002:a05:6214:2f87:b0:89c:5f6e:451a with SMTP id 6a1803df08f44-89cc4a557d0mr3475656d6.21.1774368993384;
        Tue, 24 Mar 2026 09:16:33 -0700 (PDT)
X-Received: by 2002:a05:6214:2f87:b0:89c:5f6e:451a with SMTP id
 6a1803df08f44-89cc4a557d0mr3475306d6.21.1774368992884; Tue, 24 Mar 2026
 09:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com> <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
In-Reply-To: <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:16:21 +0100
X-Gm-Features: AaiRm50CfCX5e406-SjUGjRvLfpq6TLF4DIoGNMk1PfpOJxIRVlPfNKIXGSI09k
Message-ID: <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -8vuyRI2LWZQkL4O_W9DLFYQTsu2qwFH
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2b8e2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=MBiyE5VTy_gmSsX4nV0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: -8vuyRI2LWZQkL4O_W9DLFYQTsu2qwFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyNiBTYWx0ZWRfXyxWsaQX/UQvt
 75nWORFEhwt+BtqsnmhCext5gk4VlNpJXQi0O7ve3xOUT6E2txcSVJlLw60ST5HlMEKjPTKHRf1
 vtO3yThsyE50PAUgYwbTNvh9yuaZhl+GDlgVzysBwUVqHzw0UNAU5Yev9JAHB6/zMAqr0kOLjQa
 LJNx2Thm0iyopbn59ANKSQcld/Wpsf6lUVXkGnGucVOt3z4vhZuxH9DeuTulx1Nf2lZDUN83qs1
 rE8BoMoo2CFAVd2R0IMgjrs2XDrRMIRUVfLuUdsDwOtkVd96hY9HNcWkTq346KxeIbdDPkKe4q2
 uKpbOx5pVFisXnXzHAivImeEbfjJV9I8icnu517V+7YFDeW5nmG1c2BFLYs5Pu4VijOCLQKTvsu
 qDFRGqAq723rm3Sunb+QrdwSTtBDTxWZtYowdDDSwReni3H2Twtk98UgnAIqMVaErKqpywy4Gj3
 c1C171c9JFrhCVNelqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240126

On Tue, Mar 24, 2026 at 1:54=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 23/03/2026 12:58, Loic Poulain wrote:
> > This first version is intentionally minimalistic. It provides a working
> > configuration using a fixed set of static processing parameters, mainly
> > to achieve correct and good-quality debayering.
>
> You need the other 50% of the kernel side - the generation of bayer
> statistics in the IFE, as well as generation of parameters to feed back
> into the OPE - which requires a user-space implementation too, so a lot
> of work there too.
>
> I'd also say when we have an ICP we should be using it via the HFI
> protocol, thus burying all of the IPE/OPE BPS and CDM complexity in the
> firmware.
>
> Understood Agatti has no ICP so you're limited to direct OPE/IFE
> register access here. For HFI capable platforms - the majority - HFI is
> the way to go.

Fully agree, this is exactly the point where we should sync and work
together on a proper solution.

As a follow=E2=80=91up to this RFC, I already have several ongoing pieces t=
hat
aim to generalize the CAMSS ISP support, and I=E2=80=99d very much like to
discuss them with you:

- camss-isp-m2m: Generic M2M scheduling framework handling job dispatch
based on buffer readiness and enabled endpoints (frame input, output,
statistics, parameters).

- camss-isp-pipeline: Helper layer to construct complex media/ISP graphs
from a structural description (endpoints, links, etc.).

- camss-isp-params: Generic helper for handling ISP parameter buffers
(using v4l2-isp-params).

- camss-isp-stats: Generic helper framework for CAMSS statistics devices.

- camss-(isp-)ope: OPE=E2=80=91specific logic only (register configuration,=
 IRQ
handling, parameter=E2=80=91to=E2=80=91register translation).

This approach should significantly reduce the amount of
platform=E2=80=91specific code required for future ISP blocks. It should al=
so
allow you to integrate a camss-isp-hamoa (or similar) backend, or even
a camss-isp-hfi implementation for the M2M functions, without
duplicating the infrastructure.

So yes, let=E2=80=99s sync and agree on a shared/open development model and=
 an
overall direction, possibly even a common tree, to ensure we stay
aligned and can collaborate effectively.

>
> I'll publish an RFC for Hamoa for that soonish so we can make sure both
> coexist.

Ack.

Regards,
Loic
