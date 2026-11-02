Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626525;
	b=QWXyn1PLWasPl82jRAzjAf8fQxDxkZDbgPeN6AMCfy4W7oEHUELw7X/smuPtVxeutsbO
	 eICjJ3g/6EFeDYvou0aT2BjDWri95sAq9DAxWTxTu94W9tLPO2rw+PIQm/ZRlz83+RA2l
	 oFr3A+d2tQcE2rWtR9TMgXk5Aag9PIxyWqC5iX2pDAHsQ89bh4hpRYnqkvTpMVnDAUvUR
	 xiWRqiToV19IUWt72Fwn9bvHpLIn3MC65haHoG3lAUSrYBz6iz03jubMaZj403bKQneMY
	 ySygT74ZNxyt+Pd/A7c6nb5IpdROomfw9V8SeWU353Z3t3qLzMRpcUyzJvhBnrH2fCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
	b=G/i3XxZnbsoM8ar/SvJWQxk0rx+ynXKMdwJ41Ij3G6TdircYStqwg2CZTgX0aSkfYQ5l
	 W/BQSj223ZLb5ehqOkQS0XZe0gHRZTIM919PVPcdOMcgu9jp1VnBf5W9m7nwyrB3NwByd
	 S0aWqF+vyyq+OIFFe/XOSy71VyKSZnEnzir8e0oY341VGiFVhkoKcfD/+5TDnoiboj+h1
	 vj90vbXLEu3FWvWlhGKqyWhthe3YOCC0u9y62FEmFigy658sl7YA6oRAC2b0OoTJkISMZ
	 U8B0PkQlgWE7ga8cdfu4Sg0aeFNoUQbNi/OZxBKd52XN25YC6B/XK0yCLWA0frxNt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtD+KjNR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c83ex4td;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B6E606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B6E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtD+KjNR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c83ex4td
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DArUr3627882
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XiJjr6MHKIw5QEvJXljJWlEb
	3Q+VDlJLUff5S8aekMA=; b=KtD+KjNRqA2EuR6t+EaQv2KH09GgnbCenwKpagKc
	HgOdpwMeIQdbBCzXfOkn9KQETsMPIq2io646X+bhshL89O1KkbL2p8YzTwhsXR98
	VrBH+YnpNTnqeuofVDXo/+ejOmdw9v/sIQ67TnMs/sQLBHjGygT5os4+MmaP+DLZ
	qAe4nyLwO19s26NhLw6rHAyxXpKP8k8aGgv7YEBRAXWfVezENXhPKSS/kVuFz5Bb
	3TkOGV2WVKPT+OwuvLbw4QKqIfiS+f2HHi0d7kF0fpQEucBZVvvdMAwXE+EA8+94
	Jl9DeYn1vhGgSEUJz7tgXyGsNhzppxIq35Si6dcCpYclMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62117-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:35:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9441113670dso703846485a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626523; x=1794231323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
        b=c83ex4td/bh7JICeUC7hcqsq/LW+0tCNqiqQyyU6ZyxfYb8z52XDuLSA1sGEGcbgtN
         qiEzzGnTfXLOF5+/Mxo65mfF+ahLDiSsGRpAvZc5lKp0bQTxBlHs8MXFuWl/OXX7dO2z
         nSCJ8PtorHj959w9limZyagK41GhUeBBA4fZfPuUsUWhBF0TsgiwA5n7AcS0QZZWLWq5
         3MkcbzHty8vwGmyqUAEfTCA5Bv2uSom2xh5pi745DgCExn5/YppnuBCIM8tsVbq2w4nJ
         lBRJBIx65MkEl37x0yDN6ZBack8ERrubBM7fZKv3zWi69km3o6ie3JyDC9M8PWu4FRGX
         WgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626523; x=1794231323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
        b=beiF3HCLfkhvntlDjq3QOsmskiv67WC4pgkcMyUo7YimEDNfYkKLsRlGOeVu58L/DH
         GMfAhZFk6MWR2ZR6RIqhJVyNWXRIaKjwMg0eGdjeel9kpra5I0hvicI9/ls2/ewwLGcT
         YKukSQ0J/oFnLD6vU926NrSnQUj8GF2lGdQRk7NlkHTWx6XQ5eq0I2ED9qUK8g5jHIbe
         YmmCUVnmz82xjNUpwY5W4bZJm7cxebx91/ZIDnVtpB7XwF+/TdH7B5bCu1P/iYRURF8s
         VagpN9ZcL//wuea84nDRulw2FM0aa+H+OvjipHlyMYB3rqptp9sSBctjOO5DjK0JkH7d
         /gyA==
X-Forwarded-Encrypted: i=1; AKwUvBzvPVjQswF2e0Md6h3c+6kvzWOc5sCm8ID+PxFnUjWQJU/swYZRcnSw/aqnbfEeYdCifTyC2IqDF9hD@vger.kernel.org
X-Gm-Message-State: AFq9FYJiRSgDnri9sGa1yLcnt7KH+h16unysv37whTPA7D9rwOBpDMgl
	6rFQuBcLjvreqLTLnG68o9m2n/d0Vco+wBgiQNEmEnxXmEJnpkzEPcoLGN4q8CZ0JrctSU16Jlt
	R5qnJxN6hRR9uaeKSMxq7TbnddWs7TP8mdDmyTbWBd7nWjhOW6Wh1abWJGbwd6L7J
X-Gm-Gg: AYBFou01mVqxwW6hnVnXyKg5SnooSOVt8lBW+lEB5QsfWBdaVE8f7qOBTXdCDtYVLAJ
	EIfQb6/CVRE4eR8Xf9fLl6Rd4oSWCFuCXf3K9zN0NYhE6iXbY8QawezsLYwjChdCvDLGPOD9P8S
	h15MjGG3iVyXPHdA6ksq785mzx0gg4ClMX671pHsccW5GedIRkRKGnHrQTF7FGuOScRsyAX5FRS
	P7/EhcvQE2gAaFklfy0Y7lbpVmf7ReCBeSODz9izmihACw6+3h5xxrbejgUq9t9+5IFKsovOdTE
	5x4tkVE2jVZgq0ERZB31d2bP46+pKxmVJYnk4swcS757gsxEGNU4Jg/8MJKDYA7rmKpq28gKFG8
	jTjpSNxBVWrbvKqT+2/V5UDXGe5/DFNDybT/Y93O0Ewx4uxYt97Sm3ht0H7fn3hQ=
X-Received: by 2002:a05:620a:6292:b0:93f:26d6:d70b with SMTP id af79cd13be357-944217108f8mr1545471085a.29.1793626523373;
        Mon, 02 Nov 2026 05:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:6292:b0:93f:26d6:d70b with SMTP id af79cd13be357-944217108f8mr1545463985a.29.1793626522749;
        Mon, 02 Nov 2026 05:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm259158135e9.0.2026.11.02.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:35:21 -0800 (PST)
Date: Mon, 2 Nov 2026 15:35:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 UFS
Message-ID: <kf7tlseo2i33u2yewgk7iq6dbgunsgyrta5lolustoopowxmee@vuld3isilsoj>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Proofpoint-ORIG-GUID: 1kHkIvCtwcV7_soM-wKVLydAKqeXF7dg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX7wUBRythFSrE
 SCYUEaZmxv3ARGYspWtz+WdqJ/6STKCgx7DBrkqn/ltajq7M7os8ub6xQWd2S9MsoDS14LPca+c
 bNE2/0+2bob2RmiHjgH6NYaXu+ePEJM=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8919c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX1JDmYvdGaZ1e
 0rUBmN28Z2UbJDz4EzikX+kM1rvvYHh9MMb1wc4cRt12lvPeR9AUodSEoWMRvfunDo1QmmUKvM+
 s/NQQPkni0zq0KOhogpWY2NsogRQVmJbLU4K0Kb+5Ed8BGXAqk5398pnGRbyfYzFuarIByjdwDw
 lNYWYL75aXKxsjxs+akf7rB8zyMO+5eqFq8vcxJvFRLbuRex1O724cgIo9WyUEiC9N76tOmgJPN
 0tgfZqKyEhxwLjqjCsP+4HjM1QmLwGagQQnhI3Rk+tPRq8wNZJvWRQDoyib+DHbzWflKTS3L63q
 itVxQeF3rsq+Ur+IGwljmNvtmmugtJXmE4eDc2gmameQ9BoOZlGApJ9FBRMIPOqGEQ69wPdeNgK
 ojre6CTcvVaAoFi3846rd6Ae1aA6Fj3RSRTXrbWs9D6oLqmq3uY+IdrbCrQ0q0vN3e8OgK1swGg
 tpNcXcdScPeusMSjGFQ==
X-Proofpoint-GUID: 1kHkIvCtwcV7_soM-wKVLydAKqeXF7dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020054

On 26-10-30 22:41:33, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
