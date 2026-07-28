Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DA351C2F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209953; cv=none; b=r/xzlTZO9ittXZ+FZr4NL5/VIOCXKA+p6Fhc/7je83TJNu/LIxFaAfCcoThU5AyxvFLKw9slYUH4BDuYizNvB5VnKtikRIV/q3NY6ZhN3N8QeVCeXExHp2GCj9s+2Jd+XCqujyFAyul3Fe0FjwL5jvrmboOJMy7bmY2YWQIz8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209953; c=relaxed/simple;
	bh=bCXGjWi5LlOngO80iwagJ8zX+TSFi9S8VmyazHbhnKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hK6ngLRC8agNtUiZNaA1gHTZl3PpUPAVRJ9gedVKnwdSrsJJnQbTtpio7qiDGsAag5ja12u80+/Kg/ZyNkIZG/YuQqGEVmCuyktkKFcIsrImsiNy6gy9ozq7ksDh+JYpQ7I/T1dZWcNTFiu9o9PRrwafazC4zC89RTlqbZXjDz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hx0sAT1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ih5qwNgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx0sAT1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ih5qwNgQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3b7iN1540385
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VY/3sYKxiON
	Ek9GFgTcEt+X7e4JTM8jLCswGmQC8o7Q=; b=Hx0sAT1LdLFwTviAm1onAf1EJQL
	HJRtSkflnyU+0BszRHbbEWzb8MfzArKpgDgAUCTKS26MeCjQXfrAlWOqe4HNtZN9
	U8NQVI27GOb7aE6wwKwIqb+VvUafouPAaz70ybkqHcMbq2zk5TKDQv5/nPWOn2fN
	brSulzy/afvavdIo0YFfE7owF1kAFfTucJxWpwlHpLycxghMVbrOKC5ISLwQ0LBS
	14FI/QC4hzdx0MRiBt6VU4qLNPGGyTvTs8pOrxwETo1vKHOtS5KTia7aLm3QDHyl
	gzdIjavFWWnntisNx81VgqdBQHxzc2wEt85U2tMNOe8NP3qCBoDWMtGrVbg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4ukv4tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:39:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388277fd89aso69312a91.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785209950; x=1785814750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VY/3sYKxiONEk9GFgTcEt+X7e4JTM8jLCswGmQC8o7Q=;
        b=ih5qwNgQb8jAh/QJaY7Y4w3aWzEoNmL4fHBsCLO9HopRyVwkZCih1sExVrzIpKp2zu
         pumhMKE+eqNaP7VhkNl3DVvK+LjYYJ9nRnmPLF4of4SoynplMi0xUeiFfvc5EbMV3v7Y
         hJAeix9mRMpqKn3wc0PnCVYPLk+5o8ND9SxQMDxP1wdiSnDcfIVTknb+DJ8e4FjSPl6L
         fHiaf0btOtIovJutT7ZCw7Yqa6mt0ndsktHqCAFpvpwUPMv1ruGXA8sh1y9/QP1A1ZhI
         y5LcWE+05f0OysAvrtDIfsNkT+dduCDMHnWEtTPp8jwg1A1gxjN0FUNoRQUfblEeX/aI
         gxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785209950; x=1785814750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VY/3sYKxiONEk9GFgTcEt+X7e4JTM8jLCswGmQC8o7Q=;
        b=fcYE9Q9w3q/IoELZS4p8WdDGWck3nGEJIgflfSl7Y5O7NAj95Pgm7stXUSdBWUoFyp
         pJmuhtL6H1fQMYlgdr1qQzvuX8hvFAI84Shu0a+VgC86PnvkGQSBRPcIJA668pq5IBId
         QqXmtwKLDPgQV3knEzefhXiOjRRGeH+3a8nZE9FfnoVciTWUnM3Hxhb3p5oR2N7SeSmD
         8b4dMiZ2bOk3C5XYkmDsz0kCSx1LKLkGH35Zi3Af+NvegI1uFGi6bPRfzMChCw0j9JGU
         rLkdRUyBOArom+ViNK+hTdSXHaASMsYAgL2q8q599eYCXM8VjDu2xXJ1yYP4060UtCVU
         u5Lw==
X-Forwarded-Encrypted: i=1; AHgh+RrRkTvDEA5jUi0F0ygI5t298HCUJdyYAVBeX7QFqIwGj+1CDkUJsh/RO3bwfGhxgM/z4jr6nT5yJd2G@vger.kernel.org
X-Gm-Message-State: AOJu0YxzkFpugoCMLXlvz6dKTBNjca+D1JHWRS4isSvJ9cfAFJ23e7WQ
	YLG+Jmsy5Bh7H1VcPIPGce6D6DsV6touC1lUHX0lsv5loqon5V8J2WuFfgkgcJ2CEfX6n5437TH
	URFpem10VdaUxyviqh94Jb7qS6IldFF9IFfvmPxJa1rxuUgcopJakaRVLO5D0RXHJ
X-Gm-Gg: AR+sD11vgPZrKl0WUlf93s1fyVvlrkbdAlbZrfFlCNX4K6wuzoMTLTtuVmS/WNlXxwh
	ohqJput6jkb/h9TNqZ00qAgjrzwz4u0WqtDcJpuRqDFzeTHZfcZkmhKiyNqV+ZpOVIVe1yZ2Xvi
	rg+vHDcWb0XydGH0AjX3pQ72rUmDagN9Q8ZAiUiTAn3pdUvQZNli7ONRil5QaKr29thuyfakiVc
	jeVLghFiAex3gq4LcTK4igKfBdgryJGTnZMSTaJHT531QuoR5NLiacxiPnDBls+4QKJjODhlk8a
	C1p5bEPAl8IaBVIhTpvAzQmMvN72SdDOjh9O5pQpiHmd9U9vGKhp84BPwgMX5Oc2TXgr2f64ZHk
	mGX7pFdeSGo2aVPs9EV33HHO2hgonxZKWZra4/iar4yXWsKi9OsA=
X-Received: by 2002:a17:90b:4a10:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38f6a394458mr1063395a91.4.1785209949952;
        Mon, 27 Jul 2026 20:39:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38f6a394458mr1063362a91.4.1785209949558;
        Mon, 27 Jul 2026 20:39:09 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm55782385c88.5.2026.07.27.20.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 20:39:09 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: wei.deng@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Tue, 28 Jul 2026 09:09:03 +0530
Message-Id: <20260728033903.2803187-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: 274b0878-3b12-459a-8b0f-350d51347ac0@oss.qualcomm.com
References: 274b0878-3b12-459a-8b0f-350d51347ac0@oss.qualcomm.com
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: li4Bzf5z2u01iPrn0LcD97dhcpn8ZFeS
X-Proofpoint-ORIG-GUID: li4Bzf5z2u01iPrn0LcD97dhcpn8ZFeS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX32UQ5Rk8E2gL
 8lJsBrJHT8kjci0sXBGXcFE8CqlA1hf1VCA+x68nuZau5W4J2araWgGx8qcYRZR9xbIwsOnldCP
 wYfZ96BVMSxnc6TmmnWd7Sm1UFFTILE=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a68245e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Jekrlv1qWwMfjMpu9MMA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX5aRBB2q8N4NZ
 J0reGreQumL/ebi9VthKjsiI7G2ZoWlJI0pQPqkZ8kTuOy+uXsKLl4eVMbn6VixiUWWAeeJCXJ2
 WXRDnOhGHqAaGzJly7E0pk6p5mA1OS0wZNiVAig9XB62OU2A9t8xmc5Q6eSS+stOzYuj2SmFMI3
 Jtm8D1/G6NBvwd0IXH32mLc/9wYqeFgBArmn8msXzA/uoqv9gy2elupFYB1uFql+Wkl3RfOjUaU
 lsFfihZcXAkMyHaFnBxr7ppdEk5zcyez05WlC3xgtAiyXFc0pDeaLRUm+qXZWTvwHYjN57NQghr
 2Bs+etE0+Y4GxZe9dNt5Z/BQ3AOYVmNinGHyJJ5lOnvvPdKbSjKCIxZeeGeeDd+ZLTmrCEAEAVP
 cRB6G25AB41qC+O65gPBGgFLprv0JJXK15KndCYmM4RkkQCuHuRr3VT8Socybf+oTNy56pJMfQT
 sNx/gC+xVv1EBoA6Sxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280030

Hi Konrad,

On Mon, 27 Jul 2026 16:43:50 +0200, Konrad Dybcio wrote:
> On 7/27/26 4:16 PM, Wei Deng wrote:
> > @@ -644,6 +701,12 @@ &pcie1_phy {
> >  &pcieport0 {
> >  	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >  	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> > +
> > +	port {
> > +		pcieport0_ep: endpoint {
> > +			remote-endpoint = <&m2_e_pcie_ep>;
> > +		};
> > +	};
> 
> This should be defined in the SoC DTSI.
> 
> >  };
> >  
> >  &pcieport1 {
> > @@ -923,3 +986,13 @@ &usb_2_hsphy {
> >  
> >  	status = "okay";
> >  };
> > +
> > +&uart2 {
> > +	status = "okay";
> > +
> > +	port {
> > +		uart2_ep: endpoint {
> > +			remote-endpoint = <&m2_e_uart_ep>;
> > +		};
> > +	};
> 
> On a second thought, it would be logical to move this over there
> as well
> 
> Konrad

The concern I have with moving these to monaco.dtsi is that other
boards sharing the same DTSI (e.g. qcs8300-ride.dts) don't have an
M.2 connector. Adding port/endpoint nodes in the SoC DTSI would
create dangling endpoints on those boards.

The lemans-evk series followed the board-level approach (endpoint
defined in lemans-evk.dts) and was accepted by Bjorn. Would you
prefer a different approach for monaco, or is keeping it in the
EVK DTS acceptable here as well?

-- 
Best Regards,
Wei Deng
