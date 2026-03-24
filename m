Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F84D3EF670
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375048; cv=pass; b=JwHXck+bnKg38OXikz1Ca/uB9rAyYKiwKRaroQWgXRuiAOMgsENH+B3TFmBITf9oBQjY0pEKmRUI7E6P+Sdd/iXdSTNl1V2vbNbXNsRzH59cALlAbtBU+yPvy+/+kFmG1d6obNf4MjDbsmLXbXlJ3vjXC/tXBxoZkGjswqB/ZyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375048; c=relaxed/simple;
	bh=P876SDWXfNIY+Kam7DlLkRPoG9h4PZWGuw3/fAEWziw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLbBR9KX8ydEaMLl1yvg8Xb69r/540rNN8Bm9i/QceckC5wCCL80iMWtDRKwWuLLupZpXufnEGxse4mrR/Pc+q5wY6AKxEK4TSNpxTGv3ySwcQIiSuU6WHyPqQT0HnCbyNyTxLtciNRkCuBbrYEYw0B58sVPMqM4wz06aDh7VDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQbjlWh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKCsnuKZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQbjlWh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKCsnuKZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OEKCpv2322865
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=; b=oQbjlWh3znLVDZDO
	xcc//1FgemEtF8pv62YlSU8TJ1Yb6BWKIlJC5F83me6bQgVgmVwgH/FVx189yS1I
	ns5/YEJxwnR/lxe7LGgBSYijzA1Dlmo2kkQovSDhkTJtazo9b4ifyfZCcQzuiJXf
	s0DjNobTWLFSHNmhfDKsrQ5BnJr2SzYIk6PlM54kSQdt8BtZ9FZgZEKJ/ubf6DhA
	+o0WhiF++JmcQeW8+BYvd6EFS1ontOQ33nvVc8SAIg/OO4Pa4JO+dFVRkInnhCmI
	7VQBZEXMa+x2MMahpK/QbZB2KKA2ee/LNQa7d/FBedDzMJBTBl4A7S520/U86rSG
	CDlY+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qket5yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:57:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so5173101a91.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774375045; cv=none;
        d=google.com; s=arc-20240605;
        b=EKzBG50bUjcFda0TP3Drhp0NBBhSISDG9msuA5icr4ul/bNZzOHBqXi+TAfpwWzTFp
         3PyhHL0p4NM17rwflySGOiQ+E9Aw1ypI5cSMPMYTwyN0QocyAcRo15+0qgN/Pt6jdmUV
         GYQI9Xq44BlRSvP25c3VxpYRMbKpCUPkRJKBu+6L26pn4eRWll++dQ6u2p0NeGVu0HBo
         n3hMO0F/zBlAwnO/j04m3QL9zFkflWPJ5EqA/yvFScEmop6wDcnWKLXUyyvEkDH4N4nW
         M6hTW50avo4dKLaXpZEC6gSwRGW1Jgcvyj/K7WIiBbZsNyNtldXkOcrljpPyMqJd5FFn
         Vbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=;
        fh=1yPrNgqDhYFurIE44/6BSPFhBIdU1y2u4Dk+FxJw1Tg=;
        b=lZY3IYQ/0mel7KecHbDOUDqQOan1vlzfPq1fUIp+LOotUnReZ2DTlKZIg1wfQjEwVd
         P6eURBDsXE77sLPrCTWRJh+fchOqGPkk7AKJn2dhPMuAF2+CbRrhKMvkXZdrv0TVwnJJ
         Nh/4BYXrEjjR8pMhCM7RCRyhWg3+x0CPKdKcZyLAq0p3pC7xO3i3xJ1/t03jP3oQOxUA
         EDAyltzNSLfNES6PsRkkKKeD80nImmPYqTZXVWeAPgozzUDAHzoINdANd2q52eqJT9f9
         RM/YgoHZtpy4ZJD4JyC7oaQffrpiOBTRjBHQE/2KpUTOMQfwgK3hdQ2gYM1IeLzIyYTq
         gE2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774375045; x=1774979845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=;
        b=GKCsnuKZqUEfrr3JXup5IJ5XUO2q2G0R/YIqYAjbYJitl5/T3Oal36ODov/TX4HJ8E
         6+IXLbBrUjGegq/+v0bI22FhMYa5QI66sibYADmgypQvBPzOsG0hw/pD859bf7Mamao8
         6lsQaAXS/CsC6pkvFjO8B4jn+4oGVNDUhNdryTLj9RwoKQJGb9EFYZuCNhZWRVKj7Hl5
         RA26/ffw1Ald8T0VkInv6OvvI5NDDQKW7P4EZCPS5trXrfpmTkP4kI0t+T+xoayWnHLN
         Y83AoAYYKNxH4t9+Sf0VFWX1jBP3Zg/D1J6988CXNTuj1XMoTBMLi0UgjgcT/hYGYxUk
         9rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375045; x=1774979845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=;
        b=Tc2Y59iUUq90yDaV/zvn19GI8F2VfR58d0gl7hJqQ+OyIPZYEujyAvaHSbh/gYm6oT
         58f7bXltg5C+mwF5O+8okpJc8huURA5soDypkjomwwRUNZkhDx/MNJcJ+6IKKTtdHVIE
         64XnYapyoB/IO2SJlrduOjAvjOssaKcyssw93Wwa4B/FuU9VmKjgyX4kGWRG3Gi1/wmn
         5Hgmu43qkUdVEths936h+D3S7suks/4NSsXPbO/ZZPupBgot2kTRbTOl5t5vcgJmdHzt
         Oe5Me/qDxHsqOQW2eR1ZCpeLZTYt3eoSVmcxkccBaImWLbU+vTPWnq/534fGb+69IDJO
         L72g==
X-Forwarded-Encrypted: i=1; AJvYcCXfyKT1kZweAeLntKEwaqJ5CloSF8nhl4tKDDlWvyzojKbdB00Jr2tUs7qw1iQTPGpdXyh0YzqzCt6M@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+z0nNa44XyPltIf0Ht+/DwNDHzvpaJRweMlV2mRciwDpbGEC
	DMDuvTGLWJj7lsjfwgF4AlG4PQuOTYRcM5jFfDmGdSwlTNdOi1px2HRYNQu299Lz9n22Lsa/Adu
	++TbLrHgaticSj9BC22Mff064C8UhL6fpuqFajrgz1hSW5viUjQZ+BCv5+d+TftzXcd0i/vEGbs
	CWRv/ATjplB3IZE/E/gFOOhtNqjGqIFUgaqRflT/8=
X-Gm-Gg: ATEYQzx9xbJRfXNTt8UXz5qXf2Rq83Bgcli3uuEZK/LVvvTqUTzZ4Q256lEp9P6d9GN
	CtIQWrAxaY/rXAyWyKcJwDgxKDEbkLWy95DisKYQ3IcTli0ZdpFz8bBIa12EZP2fid9Nz/a9xqq
	LjiMjBnX+3yLSf5xMgq6gPZk9bB5ZhIqMeo7qY9j5oIWqSWoU5XLET+dt3gju8z1ncaIS0MqfKU
	BjScFM=
X-Received: by 2002:a05:6a20:734b:b0:366:14ac:e201 with SMTP id adf61e73a8af0-39c4aec94bemr550729637.63.1774375045289;
        Tue, 24 Mar 2026 10:57:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:734b:b0:366:14ac:e201 with SMTP id
 adf61e73a8af0-39c4aec94bemr550704637.63.1774375044796; Tue, 24 Mar 2026
 10:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com> <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 19:57:13 +0200
X-Gm-Features: AaiRm53AshzSNeIczdXwH8Gh31QMXHywmUzyBlfAKx4t4rHTI58txnC5AXJZbSI
Message-ID: <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1=2F1=5D_dt=2Dbindings=3A_connector=3A_Add_role?=
	=?UTF-8?Q?=E2=80=91switch_provider_phandle?=
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ekOi2YqDrVwm_V4oWWaB3oKiO-brhz7m
X-Proofpoint-ORIG-GUID: ekOi2YqDrVwm_V4oWWaB3oKiO-brhz7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzOSBTYWx0ZWRfX45iUxjxCqlrl
 x+v5UDt/I+BTKVgZ5N1AV5s1wj+Nzymo7he8u7tgv1K0g71mGRfXxrKwL2bkZD96AikdOSdkGDL
 aykPcPh4+ujcmJHkXd8yxFgnROlsu/F7sDVkFk971fY/PAefnyE+les95qdtNhLxXrLH0p+Nn7W
 5Vtcyl8VleF45NX3rDAmOeKPrbw98jTP+aRD4RwjY5jvfTEj5RWLr+4RqudTd4L2p6jIe89+8bW
 /m/eVL69kKJYNYWCzr5spydJvqNWkYUFzSPCJcRFF6zdR7AqM2qu54hkEXRRYsGDW2zEvgzaQeh
 rLu6Eb6XvhhAAS16fnd3T43zz0PxL0in5TIXrlnGbH9C5zTCzNQBnakogiYFaZ61M5LGDUU9O5E
 gHK3gMJKSkoQDs3MYf4lsYgniiFDJ8pK2LUNGf6JY7USSIp+cjpSbAsYRpyrw7ksBg5sJaOE/HP
 8QmQBo7EyMYb8dJjX1w==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2d086 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SbLLz8eIMczvZioIoHUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240139

On Tue, 24 Mar 2026 at 19:29, Elson Serrao
<elson.serrao@oss.qualcomm.com> wrote:
>
> Add an optional consumer=E2=86=92provider phandle on USB connectors to re=
ference
> the USB role-switch provider when no direct graph link exists. The DRD
> controller remains the provider via its 'usb-role-switch' property.
>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.ya=
ml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 11e40d225b9f..ef8d3d26461b 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -95,6 +95,14 @@ properties:
>        - device
>        - dual
>
> +  usb-role-switch:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the USB role-switch provider. The provider is typical=
ly
> +      a dual-role (DRD) USB controller node that declares the boolean
> +      'usb-role-switch' property. Use this when the connector is not
> +      directly linked to the provider in the OF graph.

This kind of properties has already been discussed at least twice:
- First for referencing the DisplayPort controller from the AltMode
node (USB-C connector)
- Then for referencing the USB-C muxes / orientation switches when
there is an intermediate chip

In both cases the agreement was to not add such out of band handle
references. The solution was on the software side, letting drivers for
the intermediate devices in the OF graph translate and resend
necessary events.

Previously we didn't have such an issue for the usb-role-switch,
because there always have been a direct link between the USB connector
(be it gpio-usb-b-connector or usb-c-connector) and the USB controller
(implementing usb-role-switch). As with the EUD this is no longer a
case, my suggestion would be to follow prior art and let EUD receive,
interpret and resend usb-role-switch events.

> +
>    typec-power-opmode:
>      description: Determines the power operation mode that the Type C con=
nector
>        will support and will advertise through CC pins when it has no pow=
er
> --
> 2.34.1
>


--=20
With best wishes
Dmitry
