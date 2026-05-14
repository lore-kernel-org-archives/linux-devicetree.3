Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A233BED4F
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743222; cv=none; b=fB9JNBPyYDTuG2cjGdREr+Ut/JcddLiLnO5vnM4a36Qfx1I5y3UuDhkccwpRrF5Lp6FInbPdXnWSRdnvOdV0Rrr32DQsgMHiF4Ey5M+10DbDMba5gUP4uGcr/wfkvUeSMyUfwgSkxWsTfTNJJknPJHLoqOlu1UcgrYO0CQ9Gyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743222; c=relaxed/simple;
	bh=sz0PagC+xrsAYD/iccgzajP7BdAoD35WehWbqXyLlyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Exzo/xNAZNVosI0ez+HCcTnMsmgaLZEselJ6EIHvmsURFUBtzK2H2fk0T++SD92wLDqAPoVKjT2FUd/g0l8X+5+p34mHUveWNNft47mwsfH3TxUXq9YRnpbOQ5Vtxk3DXCn9IAUxDWnGerm07JsyjRekWtNhY6WF5I7SNBlL8Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC3PDAWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+/zqqOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC3PDAWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+/zqqOD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E1eIvO1243012
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ixpOPWUsk4SIfz2iEq/00oC
	QThu9qSNMayoJJuninQ=; b=DC3PDAWTGaL3gB5dhP46bBnI0NGYHx5rgy8rGU9R
	/n0lQ45zVVA0m89AiGpD5LNyaui5Jy+TdacyTaTymQNRzVrh+gHPuzLaMsg5YgQb
	qtH6e6VUbUlKN7ZWXJYoG3dEvAObGRXwSSuTVypHd86J4gxgdP2rEAOvbd9EHpaJ
	SZObApTAwPE8to8vaA0pQyt0YjtXN/vH8QlpbgAq6vO4Zx5WbEh7hczMLuCIauXk
	UX5YH0pAt83IVA8j9nUqkf0ipMcZAFU2QSwdnE7xOc633dvq+3mKA9RWqiHNvXdS
	aEsHC3fF7rDHy3tF8aaysgOXG3zIvNzoCc06s9i/y4U+HA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4ttx9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:20:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso15668185a91.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778743220; x=1779348020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ixpOPWUsk4SIfz2iEq/00oCQThu9qSNMayoJJuninQ=;
        b=R+/zqqODODDqLYgTLgcdgtiwdaLnHFy+vbml0NWZNyHjAKC2WPX9cpQ66crnqBkgjC
         ZvwiDID20zhcJF9VF8gPbCM8X6VMFzgSgIblLuXIUdv8Nfk6JJj5KWtEQhoNhXhpGrNq
         72+jQ2dSXeIrpd3bVEyg0XHMTeZZZv9LCk/258oedVZ/hJ1lQOkWJflSY/5YfT6xe6If
         w0QTivvECFQvl+9/h+qz7ZiSjHB4guReb77ogPRKG83zrF9+LEEy6HroCeO7gIryc70a
         zP33wCUKf2xjtEJ/Ek6E+f0pVYvMKkt9U/uTxxSHPVQa+I1HPC3JqOGmZEEpYdCldJ1+
         E+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778743220; x=1779348020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ixpOPWUsk4SIfz2iEq/00oCQThu9qSNMayoJJuninQ=;
        b=Z0/gqgYzyfoTztMW+rxsBok5vTHrDllv4UzAbHMOT3StzLszdwTpOagNwbuWMlvx0s
         abVBhsnxOQeD0MG6rlN/KFXwlNvt7ysdJ53feCSRukShQIEJ5xVFAdfiQWnlYFFsvqSF
         eYjwMqFSmhbTIhooRHkDbRi8TUIgk65qccbsTrwp9Q3ETN7ZyouDv49DmpnHiMwuWMDU
         18565RwIsfC/T0zWNnoWI1xGUnoxt2vMLInMeYKbkPYScbBeaVGapnZNiRxBhHl4XlLL
         OrHbfc8gNc5Ui4N7/2QqLNJpL/5ukoKyRlwLE9swQa1pj67/QNIi1RUKdPNIfPxW8Usa
         mvZw==
X-Forwarded-Encrypted: i=1; AFNElJ+TWe8KBZssDKZmxbEDKKyolZcoWolLoinWWexJSe80p1P9Sa7dgNRyldggUpEma07pQOPPAS/O4XcL@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVH64Gkj8lZ6XFKvQdGbWvPz5i4umAy+0sgORSl8aROQX8/7V
	C5WXTzh3l6gEqKL4Av6XdFqPLY0vGVVWy0hclwrVyPEeiFVsoNEoeZ8i2NB1GbF65qoI5GV8epR
	98r3v9VT7DzKGXTyCxSNm16NZw6xhIpv8yiQS9iqHUsCbfXeCyGNH/0MPE24GUgbW
X-Gm-Gg: Acq92OHTngZqExqE0QT5ID2l9TFqUlKZEvvEcYy2lZV4jC6zbkdzS7ZjVKBXeHSOVkc
	TtMC+c63NMSfsuThz4hS8mXXchhBoLgQx2sv0+23FoOtO6sYKecQ2veZ3hodcyWmW7s8ADoegJ8
	YdOeYkZzzAnKSkpSa428HvEWSuVilC/o2bV9YsDDdphj45L+9THQ/ClWBi7cSLqt7umKYC0NNVh
	ChIbwVaV89bSE7eYLbjlQAv07A7mEQCPapbGBN+OGbFpvvd1a0RJYDg0lm/kra1/sL01L7lMcoa
	sgYBZcaneMevyWuerOBnW2aqdAX4DfNaPnYdUeMczvhM5K3sD8MR4+lWxPje4qtuopuO/LUOqup
	W0/YgXtpKerVrkz2rHkQmKR3C2cQ3cFmGQt7IbHu7F8QgE+kA
X-Received: by 2002:a17:90b:3845:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-368f3d183f3mr7267863a91.16.1778743220057;
        Thu, 14 May 2026 00:20:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3845:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-368f3d183f3mr7267803a91.16.1778743219456;
        Thu, 14 May 2026 00:20:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692e706875sm1678572a91.4.2026.05.14.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:20:18 -0700 (PDT)
Date: Thu, 14 May 2026 12:50:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Hawi
 Platform
Message-ID: <20260514072012.acgmmzdo2aeugyq3@hu-mojha-hyd.qualcomm.com>
References: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a0577b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=knjUYP8iK99Px4kpKqYA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA3MCBTYWx0ZWRfX2h7h53anmu8y
 sxB8vxx86eRY4k8oIrU0EW32FXfZ+QwWIXavGEHba+WQU4Jtq7aPfRJdbbPHznr1t9RjSStG8vV
 KyDAf90M7Nq+y9BWv5nPvKwDfd7YdKG05Sib1GuDgzc+6De7iB3uoBF+p9kecTXIYKOhVwL2nN5
 a/GEnHA6CPKhsvONLBlmhwu4sfn8y9Gyp5QPaByF8ZXQYleUD2eEqF+6W8Z3v8ECmMMgP9r9zk5
 F3VaKQAXQBDBbdYg8GhHWehQ6tXBJuuNG7PqOJP8Tg2WWHEYPcib83OBgSJiFP3IWNmFYJdzv6B
 qt/C3KyyaEGi7CevBS1vKF9ZwYQFGvwvAcl3qYxVnWAfY6LzJZbMuVtaLYvmeyO1i0oyxzvvzys
 s3UisRqKu7P/2FQanHPi9OyGQP4JBE2f3AG5fL4unPk4yh1SAGxptlpr8cxNVdjYG/g9u3Fo7FL
 O+hTz22SSqAFsguMw4Q==
X-Proofpoint-ORIG-GUID: jfiiPr2Y5eC6aqNZM2K0etRscrTHo_3I
X-Proofpoint-GUID: jfiiPr2Y5eC6aqNZM2K0etRscrTHo_3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140070

On Wed, Apr 01, 2026 at 06:21:26PM +0530, Mukesh Ojha wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> Hawi Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..7dbc3ac6c5c9 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -25,6 +25,7 @@ properties:
>      items:
>        - enum:
>            - qcom,glymur-ipcc
> +          - qcom,hawi-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
@Jassi,

Would you be picking this?

> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha
