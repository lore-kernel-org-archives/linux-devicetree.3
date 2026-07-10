Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DFF42253A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689730; cv=pass; b=qODsUBKJbqhpNO6h1FOeIDxTKxVQDFZvO9K4+VVe/+xZEFMHS28ZOD6ke/gOTH3UUy+uI1q3SXlcdwA1wNZHe08dXfWk+nGujIjfzr3s/0GWC4UdVE7zpPFsOUSajf3Qdo1+Ju7SbMrxOIpCsJLbAterSYnez52R1NjQTmlgg1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689730; c=relaxed/simple;
	bh=4KmKDxIXwspt6Jccei/ujhRUVVmRui+JyLDUBsu54yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4dLgoDGugdlDFwJVLt2nz0FO9w+sBhG0yVrJ8xexlqPmpIJWgiqRqo+7oDIsELvU9th47XtUgWd5SGJeHSPqpAzcAkqjVVsM3v1aYfZLRjbPY+o/Fg1lFJE5pwxGixScpNNvSdaP8ywBGSpbbYP08YU7lbHY4kQsqkU5P0UnTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXt0FCIk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7LtEQVB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXt0FCIk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7LtEQVB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5toG910208
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=; b=AXt0FCIk3DGKI/Nf
	pBp5yCPv6UEDsmhYLoWUYxfExoDKdSex+bAkYEDQtib/RTLJMBNYLluw59O+WHLC
	vI/00XWT7TMDcDQeBJswrEXoYtCFKxoLOecFNi6J0l9j1JfKUfibky7pgMm3CtK+
	X4gElHkuw4loNDmcjzmQCrApudoXCsKa69wvqBc5PMc68BwgWgLpKF5AcO4n1CCi
	+qtIE8LwMX8RwiXmNcHB5C7kBFI/8m+a6JGoh3Qq0I3W5MZ1ioiH1UHx1HMnZfw3
	D5INMvKJtgt2A3csGxHhlwcgkrfszkPh6dolM+adj5ldp9WDJg7JTfoAWLIdJtJ4
	xZW0UQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweangt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:22:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f39a46efd9so24358256d6.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783689727; cv=none;
        d=google.com; s=arc-20260327;
        b=FG+YU6LX7cl7VDTQNKiBLoMr92QG6ZNWrX3kNgp9hBzJzMoIeb5nNLZTebXLETxzuy
         R7rCK3msJBrIHbz90p7aglTH/Q3LyM+Pa9Cl0A4A0aujTJgCUZ6+Q+wzBSj4pTrme4ut
         sckJuphhkKG6vDFPCsDOsB1Zsve8WNCqVJF1tFM/8xmyERZehxTNMBTQmtOiImXEqBgK
         g6DuG8SeFwn/MBFtV80qJhjqtkeCB7cE4AcxUyB2Srp3rlSfYy7TkmbaAfPwHIz1jMy2
         j+k1LYjUuxBrOvsmRQhfKd5gM+jbp3uu/bS7og8Jguke9sYAerSOHmIx+h96F1u1pbOg
         R/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=;
        fh=Zx1lgjS60F1Z7t7JjMHkZn4TtM+BtCYSwHDtI/UQH28=;
        b=sHL4cA/01V6mwo6aGy+NlzBfv9vHhgF68JFVPzmLO6FJ86ekzcdZEQTmy4bWij25Y0
         z599e2DOfT4fh8eeGqpkjVfM+IfzGFrnD7WYf3oh2ghq47dIJ9F29ycPmQ6nxQ1kCc3e
         k8IWzma7qWgICJyLAgaF8s2RKQLwoPOzkNvjJP3LuyHvH72gZf54AVuLGHC4YqgCMTPU
         ZAdHpwzW+2YjG3+gqc8ze3ZqEGm6PjE6hrX+vzCpK7O/9kF2sOXIxFSZlTgvgSFdeFVL
         08Cr3LnRjwPhkwStCRlj2EVKVvcapiW87kb8+qoDKb9IaNi9DFJREUjo+WkRSYWrxD/y
         ftdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689727; x=1784294527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=;
        b=T7LtEQVB9JSWyoVskbnjWQfOuXPFujy93s5VJVWmOhkxc9jMxiSnqXdA+PvMLSQrcK
         4MPCP82x5qar1YqhRNVDqTyJNZmzHW2QPs1Fc6C27B555RYSAyURjAi+EBJLbvfnV0/k
         D29hDC+KPYG3f/OQyH5Q2aWpQS82A4pl+rMWN7ET6qVo0j81pjHWq7zWsilZjAxwRAQS
         LbLkmzIQgHTswjc9RivvzDx/qw4s2ATk5tEteu/a1s9v+t4M7Amyrho3PgcNl/bbi/0o
         FdWFj6fkkEi4pivBDrT0fT/QjzjE3Xxb8X0y+JKb9SXOBrjHK0qrP+RUyKElPP4g32L1
         863A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689727; x=1784294527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=;
        b=W5MNVj4fY06TFCpUjqmv4thfeUHLbc6TxSZrmn7j1lVYbyq1X7tARcRw0EVnvZOjmJ
         eELvtGb08JfD/v+3jl0LpS3ODdGNlh2HLRSo40tWttE+w7pJAqQiYu7ulTYH0CY6N4C9
         GpZjzD9x7bR/twDLddmMAwhBR+/qCTBwkvRVxaF112JrYSYtFeK6FI9mgbI9mEiL4N66
         EWvBeIr7gEFUpp+2Vu68KEGywEFF2ce0pzDr0urEFVBW0C1o/phq/Nc2aR7Zqd5UZa+7
         x9HJsWMw2jKVrwI371jUoqk0im4HTL+i9lwJkveM5qmUzFutts1rT3P/+1GOUy0HwFe+
         qOgg==
X-Forwarded-Encrypted: i=1; AHgh+RqczSnJnbqIZlVRF/V5qxmARK1Ipz4gzdEqkFfUbwxFSTFMYIZxAHVXvW+Cx3YEq+8ESchjZ0a8nFfo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4xa1ZI7CvO4h0KMbkU3R2NBZaJTkmrNB+6HJ5TweHvjVRdMjz
	2/89TZsbNsbviFCssHKPmakk7UKY4CXRuRGmk8XEd52v5jZkGgw+lZnHhl6lbxCDINdH806B2AO
	lpnFF+RgigMzSl+np5ZgWjdnha0bpbjT5mMlxfqVmLgjee7ECrgT3b4/9UEhcx1O9QCrOCEGLFR
	iMK4HbgixV8DkmU2vLXAc0pOcumdOzVj0sVoWGM6w=
X-Gm-Gg: AfdE7ck1xqI057qGfIrCBLO2RdfvuUG1VCIe0EKAX/xesujYklYqilM6jZ3OD9Y1IPf
	8GamavZOIWezUo4/EYn+xkdIe0f+RL3uam44jjls0C91yHCeKJ/Tzi1jGxhcYMdTI5JWXozyCS3
	SMxSyEJVC/wYjQbpJQPjK7sEtGE6KhrQ9kZ0hq2bjQIloPJSk5kGVoxI7CApxyYpIuufrS
X-Received: by 2002:a05:622a:4d8e:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-51caa02bee5mr34237471cf.8.1783689727487;
        Fri, 10 Jul 2026 06:22:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8e:b0:51b:fcc1:a0b7 with SMTP id
 d75a77b69052e-51caa02bee5mr34236931cf.8.1783689726914; Fri, 10 Jul 2026
 06:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706195818.3906949-1-sjg@chromium.org> <20260706195818.3906949-8-sjg@chromium.org>
In-Reply-To: <20260706195818.3906949-8-sjg@chromium.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:21:56 +0200
X-Gm-Features: AUfX_mzmOYvznpst6Fhzo_RRhZo2t92NP1TaOref0jVQgAZ-t89JABzPIjGVV8E
Message-ID: <CAPx+jO8t8JoTJJCCMU_yz0yyGQCSA4cKsmpSeX_=jEMUwuYsuQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] dt-bindings: mmc: rockchip-dw-mshc: Add RV1106 compatible
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50f200 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=cm27Pg_UAAAA:8 a=-hWoO2I3uisOaqaBfXAA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMiBTYWx0ZWRfX86g2w+RCzhtS
 76uTX9kx4PgvMKoteAZH2n97o/OguGWN9YbZVesgUIp8NABoDxdqh0ZDQB+zaxo8gSTHQodyl5b
 g6EAvr99sLGLd3AlrulhVrfv/ZWrjfbaIMW8nHkUZvuQXk77DxT7aa/04N7jI8jItZJxSHAlfmQ
 vnSGGffDRxf3JDet5SJ4j+7u1spjfkDQAzfjKOOJ+EgA5yYx51J2oCeb0Wd1JK6CXLQJwym11hP
 qqnA1MmOqSY2EUHGhPkK1zFsMaov4ZJcB3aYdGZkRHAwmYnuVTa1OKqRjpRB3ZrS+z7XQCKSYNg
 M5NI7zd5/L23E+gYa5gIzwIskySM3RDpyYpNXOltknRgReq+OfPXkJT2pKP6TnRQ7/QlAGrVz01
 uoU96JVQ5j4Pvw/hKd5YoPEEV35Nn0IoQhJ1urdOwojBVWVYm7JBrD5cPaEvTRZvmCf8wad/v2l
 z7h8aX4l7ZGKqJXB4Ww==
X-Proofpoint-ORIG-GUID: hkrhAdv8Czn_pj33KK6fFL2fPvo3rUVR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMiBTYWx0ZWRfX4+QcTGKsfKMl
 sH3K63OIPWgp5MaYRYz6P8Yp4C8FK6L/m7JtwmEILn1k/BEcWZEg1EALZdF/1oK3+tl56crzV+s
 VKckVXPw5NhieEFBjSKakkZJ0sF8hFw=
X-Proofpoint-GUID: hkrhAdv8Czn_pj33KK6fFL2fPvo3rUVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100132

On Mon, Jul 6, 2026 at 9:59=E2=80=AFPM Simon Glass <sjg@chromium.org> wrote=
:
>
> Add the compatible for the MMC controllers of the Rockchip RV1106,
> which are compatible with the RK3288 variant.
>
> Unlike the newer controller in the RV1103B, which uses the RK3576
> fallback, the RV1106 controller is the older IP whose drive and sample
> phases are set through clocks provided by the GRF, so the RK3288
> fallback is the correct one here.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml =
b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 4965bb518c54..21ecfaa454f4 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -43,6 +43,7 @@ properties:
>                - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
> +              - rockchip,rv1106-dw-mshc
>                - rockchip,rv1108-dw-mshc
>                - rockchip,rv1126-dw-mshc
>            - const: rockchip,rk3288-dw-mshc
> --
> 2.43.0
>
