Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584289;
	b=yIJkUqGpBBbkw424c2qz3ITrIH0AOPnZXLk98KXCrkaWSJAsYww/qY5BZu48cdh2x26n
	 ek19giPnPdYr36HCJtJUq9oIRWxLfIXXTA8vLbA3XRBiacxlZq1wnR6aq5r/3WurFEKxD
	 22GDqdxa2yIOn6KBklczUXnX8op/Mf5W8vcRINOWNbk0P7XDeJhYK4C0KuN4pQs1hsW7Y
	 D7bgMu+uAlNo3HUQUw0gj1q80GLlb6FgNYHEIJarZY+RkoOj0YZu7C0zr5w5i2hPqwcDj
	 6Jeb+6iy5hN4ZeIgYSwOZblEMXLRtQ5J8ofaQ7zjW9bPqZH+Tt9zqaLSEPxCyH3W5Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
	b=j/ws6hjsPn7dkBYzmbWyzocaJBDXyU/1WCW1VmOx5sXQ5G4isF2Fabzps4UenZEXduSl
	 g2mtJ4U3ex493xJfOY6/lHBLN0995LYgklZnSAEMc6idnfDzAo1yLHW6jl6Cs/yNYdGaG
	 3Dw7z5k65/S7joFpZslKbxYtcoz4KKYSzuaWo8+JfiouS9dpuinccuz1SJUuXn1qjgE9I
	 GXeRDcndt+7CvzaGMuKsXdG9S2Bapi9p3LqaNZcSlu2fqclyjiI8/ULTJsce2s+kMr5H/
	 gF7RIMmqKP9NQtAMOFpc7YvMM9lwSQQj2i2zhatN05tTBqPlhUCuUzLLSPLK5Bdussw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+cERM6H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U+h/wjIW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2762606A324
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2762606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+cERM6H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+h/wjIW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgHbD544669
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lVnw2USx2TyzNv+Sffbcxp/B
	IiUfguSBZbsmuhMg8fY=; b=U+cERM6Hs7kMYYj8l8dw1V3O4BY5C+TYCPX6f1hY
	X9lgC1EeLQazoPLr2w2ihUiLPTciOw0kaXObHyNrclw2NDtNfvJ/03p04DsOqmK1
	DnnGJDu/KuTAvYG/+VvwDSEvkztpXs7awKI6kzSwU7arHuxAwSd2J7oPntrYiZTD
	vq4tXzZrqrdPXOmlYTmksaKmLlKwHydNMKvJaVUFs7NC5XPuWZMgEMNk8X0BZB9s
	TbJXgimEDbqV5lL/k+9vgrnwnvGeYOWnoOFhfnMa/qlEzKze+z+/oD+Q/V33WNMD
	2LKcytcOJOi9BDbsQQ4FNrNNiGff1WhWi1DzUg6DG2axTw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48kbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:04:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso94146241.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584287; x=1793189087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
        b=U+h/wjIWg4aA7QCwEArgmI9mjjuKTeO8H7TIEIJigBhyXJvFeuiQc8nYCLSdCcpy4Z
         fqjTSoXbOoD0QzdvG+IOjsIZeWrLXnEEANbafhkTT3OnmH231YDhxrA1ZzTLKYtNtTJu
         g34iZ7jNHAcSxBv01coIOiUeAIBPf4zUeS8PsmQVXhmYIDccFsckSCWihO/n3oou6yaY
         BkF4baMhGdRAbBXqwARKPwwN064Gs/JTf44q/wp7d8tXFDmQqwWsa4N0V++auZ4dbAdH
         R0m9KwiUyNGuOfjbjPY5YLLppKCgii3Ay2ojT29ZMlMPEFlvtXsc0Xm8h6WVIv51PbjA
         iv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584287; x=1793189087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
        b=ulHRjCqa6cwXtPo4AZbTqCbw30sEB56hsgjitVraCpnTbYnGATLXmkMrE1XuW/bsCt
         kh0/GlK8nepc0yzP6IXrdZmShAbemMY5kVAHAqp/yciQfit37iUYSGPc6e8hKc94qzXJ
         ZEYpIA2/E7aaO4z2cwJ1JqhW7/WM7+AmX8W3RLlbc5lxc6W1nQEL4K/63YjcgL6KOXdw
         qmmVbyLBqZ3TTkHUV5t1dhHRhIwUiMbsDQLCdXqWE/MgnyLq0U5k7yAoeKzZMquPkyTx
         JHNL7vFbNvy7GEAsDe6tjryWi1aO9bpViSETAoMfyZJ03ZPxzlHQ2aq5B+9/KJ3lAs2g
         dvOg==
X-Forwarded-Encrypted: i=1; AKwUvBzBwMGMa1FvCV22u9AbhStPMeU4p9nrtogwtAZq/aAv9KhkwHeTHatu0t9Yq4Q9oLCZEYF6TpRWdK7d@vger.kernel.org
X-Gm-Message-State: AFq9FYLjbzzN8bKsgQjqdJCtPCbF20755agftIt16WE1sluYbX4OvvDd
	Q/dp7l5wGEyTyGtMY4T1fu3HbKk0XOTcFl9lnJAeVrDQyQoKwoEniRLNjTZr8BfBoA8MaulK75h
	yYlm1eBggBYDkE58rVIKNHzZh4TDFnSV//FOtxW1trPB0XAIuKOdDOUI5o3JySKEg
X-Gm-Gg: AYBFou0k8SWNS+WzXuCk8VK/6h04pYYG/Mo/5epUIbUkTwfHhz/YmipgYFHyknH6mLC
	KuE+DRL0YJhlM96GuERC3/9xmT+DSi1RFcHpDZDEuIrUufiRoeP4TYtn8ve/MKnlvWoz/mR6gDZ
	srop8eWBN+dcv438g5+bGaXGRkqQkLbI7wfeHGdn6zzk+eM67p1xhshL/DRz3tLjDjsVCwMQzxX
	Xl5GuKnwessi17j/VkVyLPu8BrKT5g+bwYxqbEoLgPAt/Hian4BbxavLnery7uCnB6X9Fg05P06
	/iNX25fwoGnTEkAu3z7iLFJEKqmIFrlYDJxqKnj6trVIkVzEL/YUeOZ1e7PzjfRpTcTwR0pnw+y
	+SVeoY7+MqBnZaqb6
X-Received: by 2002:a05:6102:688b:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7cc925e0fecmr559548137.11.1792584287245;
        Wed, 21 Oct 2026 05:04:47 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7cc925e0fecmr559538137.11.1792584286653;
        Wed, 21 Oct 2026 05:04:46 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm44223715e9.3.2026.10.21.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:04:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:04:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
Message-ID: <yzgojjbovtrbbz3lomoe5qiooh4e6f5dtrjpogvoj2kv6cjm5l@jdvh5nq6fupz>
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tEdZOZREl09Z0zPeHQrq4AgEBXjIWaWE
X-Proofpoint-GUID: tEdZOZREl09Z0zPeHQrq4AgEBXjIWaWE
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8aa60 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qltNFNbxueZ9_HQRUAkA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX4c2IYp86IEDG
 gDv2XZEJSj1zyEEanr6DMNdVfeln50dfU1XN0XGwfaHd8ndSiq6uFHdWAnryzcF9dzyfMjdrkQk
 qNAEMVoBJnPK43An/tx3Yx538ZCZ3pRHWweauQYYtYo3fd78cov5c8m7UygF4ryamHrZ7AYnyOO
 rLT82rZRw02nUF3JRil3p0cemHJ6wRrwnbpmxCyrTSF0ppS3LUYpFou9S2+/7I4DuE5A9RiN3+F
 B2GEgO7o5ef6/2ymt1i3MBnDeqDPHbGzokV3pIkhU8r4RyqFLuXv+gp4spO/mmEn0aNMc5Ib0p3
 mPKwzwZyVe+pG68srt+ff3ll+LFtkyjStuN1YJdK4xzYMWtykn/WRYAWOENYQDmj5X5ktSaUALx
 SDEmkUgXAlqNhCIkKIm+uvBiNVh3Gn949JJMlmjeDuw8TPFBx56dL4BzP+WR9FZp+rSzS43P/Ir
 +1V4y2KqUJarWs93lkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX8rE75SPzkZY1
 ANx7/b3NPd7uP8PHUvRNcQ2rjY+SgLgHQvA0tnEUOVzrPqCreYP0/mIznVCcmKAc8D7hIsUXX16
 wG8MoUCjgXmS2l7jx4KD72YYn2rAUJI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 26-10-21 17:15:02, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
