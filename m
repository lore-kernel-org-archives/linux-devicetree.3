Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B849482A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992258; cv=none; b=Ek+dPDrEMTCE1K9v69+qjsKGb8ntt1TN9+M5Ycjh78ZYO7fhlWzvq0lxcRZpgxnB5/KHg+nHDUHSHmIZ2P89K02muyOmwN7+6o8yn+wFa8hex79U2QH/ylKAB1HDcU6i0UGURM6ZVemnDYeA+cTnPPosXYVZCyUcsu42AObFzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992258; c=relaxed/simple;
	bh=XRcFq7IuXH9kC8tr1NldVZmFxCs4PttO+0bLD5IWDAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx3EO0FryqElNKdEriywNsE127q2PKxoQXPVrXaIVzWxNFH9FGio8CaiBI8fa4JGGlnSkyI43MfIheb9x/UnQfO3W9pHMBmvhRbnKqGKbSYyZa1xlbRtn2ur7RwdpvbxGJpcIQPC6viZJS4lRnhOwlcljbLJ6dL/KipNUvqb3Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6isgjoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C03+e1qc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6isgjoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C03+e1qc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe6VZ934518
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=enveY9jv1nThYF2kaQKkUFzj
	DWdSqrtaseNwSFGaCr4=; b=U6isgjoZweeTIfcGZSSS8o3qu5QGVnoDKVHcKiWU
	u8kwH7nSD18DNNuBZqbCiGyq6/lTRhZa4Wu+O3Fo7ECF3BWs4PvTBBTmzSAIOGVN
	bTZ6AFddbVXCejQnGWxk7RkPrOJ+fL4Nd8Iaaqi7yKylPY7m7fJpOzyouMfzQwi7
	7ujrCc1SgVZ+pmZa01znPs3/bM+nko9Wrwi0YBMSxAqw15RpSu2kV4GbJr8IChQX
	t4GcNBE8oaxeF4RqGXkFPt2YF/9ydAnLQzA7QN1McnpSBw8yUo7M0nNSm+CeeQ0p
	Gq0CL5pyEFJTdBobBRSZvzpb18Zy29W0+zbTC4rvEJL0Ew==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bagff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:04:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7961a79fcd8so849730137.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992251; x=1790597051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=C03+e1qcPnnSqqxLOANSQaQhtikgxGMka6/FfHPvbCpWzObc1nWOBmWU0d3LkbpTSk
         8p0d4ceparkYAT7PX3hbNnTA0npLddQNBwTf+xtvs7CSjAIUV0Lq9V5g61lWHgz/FThr
         /NwdBCd9Cd/PODWypGLDrtZ/zDeo34LLd+7GpYsTUzEqVagcAqRU8R+DswYUog7kwhJU
         LY3XOBzEWPFNvo1822Hnkg/PRFKffBqykURn71YSemceNaX03OqsiPajmCZBnNoZHxVF
         J2+VEHipXKNHryU2CaZ8/Nclt1kDiwfZMba+cJCLUKYBENcWlqc1vB58naB7hN1ceuSW
         ftFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992251; x=1790597051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enveY9jv1nThYF2kaQKkUFzjDWdSqrtaseNwSFGaCr4=;
        b=KMlYCLv2Xh8RXZy5xGZfB60MyAStK1hKVNMxikw9xYs9CTRAg/CUb6omG8UG/xclam
         86uaW0OcSMYb/KI30jZxnNssbjb76TmULKR7TmE8ldXb72gE41mOdLOVoI6Gz/zPbsdT
         E4T5Pn8YEm8oR/aJ29/nrUXET7TLsoyUsUJV5cp5XxrxIV6cEnyjcHvOX4EHJL9Hmeeb
         CLS83mgo1mYeGcQu5tRWLbKPzSabuBJh2UIrYyrn+L7OVO6bbmoBayHnw0ZHF98B/EP2
         ahiXBl1QeSJaFYBhIS8ZF9aNx4cVpgdsy4/afPGUIwrxnFD9c8cq+lK36MmtForxtzcO
         p/tA==
X-Forwarded-Encrypted: i=1; AKwUvBxAwywqQQB+AEWpDMpNYf5TIRk1Y2tiaTzMnezndWsKd8E19g9WFGAZR1Nl7qgFbqEC/iR7XdyhUgwT@vger.kernel.org
X-Gm-Message-State: AFuF++mS1lwHU+F/VNXmN6kD219vZMxdweLzHjP74T+cUQkA6MoG5CYK
	F0Jdpos9Qzi9tO3Z2lFZkWUs2/jEZBkWylzgd7oKChcYlsy/AjTbwbkol1wcvL3liNk2z5BNB38
	qMUc1Rr/bzlxxdwkIBXCp2ThmUKpSQ+0MHaH6ouRHfQn3kQ6F8DAjV48ILCrJTV5w
X-Gm-Gg: AYBFou3vMyEQeVUNwtL+49pgPi0/WalPr/mUtMIzPQN2yduu0wq+vZAbP85GFSW3f6g
	3/RbgOyqudqm80zgl0yG8f0BRSEmFGebNwL7DgoAiXFw7yjpPjqqa/fZ6DyQcQHv7ph5xiUkLTz
	atNyLICgj6/yf+p46L1u61hyFMurmUqPvrfmKSOeCZ7uXaIE5UWyPfMXiB9s7fU5p3dTgLta9Sm
	+FMIzRjrJZAy6bjuBBprKMLFjgmmjVh8JErvGv0oUVH4CQfSyDo7CmqI/BMf7+wCis+l/bklydJ
	qTsLXFen2/S8zcM6tGGe92xAdchZzc+di/3sW0eHmccQxpA7njkbvryqEqNuE1Xc99PZ3BFeTR9
	SnBgN8vNF4V/V1z4=
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670585137.29.1789992251035;
        Mon, 21 Sep 2026 05:04:11 -0700 (PDT)
X-Received: by 2002:a05:6102:4244:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7a719aaf7abmr1670527137.29.1789992250513;
        Mon, 21 Sep 2026 05:04:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eab91sm245354285e9.1.2026.09.21.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:04:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:04:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 06/11] arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE
 clock to GCC
Message-ID: <gafrnwlti6ojl3nrifhejf76voamomuthwuikfmbkcot26fe6o@5uzaftq2y5mo>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfXw1IhiRHL/4nI
 48zGH1jLR8S3kgBsLqUv+a5VkVNRYEuykr66Ug5F8edBdSxRvnW8nREm63oijEjf7DG2pWLfvb5
 5RevjgWcBZYF8qWLdxmCTEa1AKImSzy/OUHlhTlSW7Bnb/qEqRqOAjBrmeUubjrMXjn9WMBzpo2
 QEk9LkDdMRYizXbT2X1M3KqsMJJOGqxDBm+/GKbCevcaSQojom4CubXONrc7RslVTHX0nUmPRiE
 PDBL0d6lytJuZkvboZGaRTSmbl+vmeQidrLHO5Bc8++BM60X+ErkEQMpxo1xznZmK4jSxa/Ze7V
 z3z2c2t7f1Zuk/qOdq6s+18jMIDYjm1uzlTL/utzgd8K7yzVG37oc4l5r7NCsk6EU/2MthL9+1z
 uOrThMpAZ5nHUo3ilOHQ2ZGWTEbW82dWBe2I6yH7TQ1efGxz5UuW8O3veTl5iXqYdUBp+ZSU6Du
 2eAYXW/EmdiuyAI2hkw==
X-Proofpoint-GUID: HEnSrALmh-jWEQ95OXsTctYIR1uoMDAV
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab11d3b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KhyLHX4QOuxJUOlieskA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: HEnSrALmh-jWEQ95OXsTctYIR1uoMDAV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX1fnz8rRdPs+s
 sm/hhZQTknxsb/xcbpGwLxkb1VZxT9mbbZFInBwB5LWN3JoEjWfIE4wSKfpCoYOe8QaKafRSBJZ
 DTTGgy8fWsL+5mHYOLhxgGCitrfve2I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:39, Kathiravan Thirumoorthy wrote:
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock
> can propagate to the USB controller.
> 
> Cc: stable@vger.kernel.org
> Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
