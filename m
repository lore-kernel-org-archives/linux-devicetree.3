Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25B376A1E
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908174; cv=none; b=T2m36MwD9zVakJlR4MJ8WF/OHrsPUsrjEhQJmWpuTwMDogW7WNCL98jSuv7sXXaeC7rLjePEA7G9/9ef38hLzxNwlqM5vO0n0ThUbY822pSfLEpW5uENvkyekYX69g08mtObemIe2HBHZ9wRepyIR1Q/BvyQaZiHdczLRbQ+GkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908174; c=relaxed/simple;
	bh=vtduYSnIjayzNxB+nJZ+UNHbp4mpe7trHIHbjV3ngG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bR7r3aMIOmnDO/c5lfYBReGXTSZhcw1f4vAGJq+cv/jZaua3prixco83DZY3iueHd0b99VBIzD4V3HCU6McO668B4Jx/CEr5DdpNjKdrnZI2d3Mly135T7rNUFDtqeXvKEm6OGHlGw2nAnYHL3lMT2W1fmCI4Wik7oE8yfjNb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f61kBGYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmAasHwG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f61kBGYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmAasHwG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66k3i2045954
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ntgQVvTOIQGY8J2ZeSSGFzBE
	pXgFIQN+dLFgAr5cAXw=; b=f61kBGYTW6erpLMAeSD5mRxKuge9bq0mavJtByWv
	kvha5JSen7vN6+YgjrtdQekWzrcuxqlRnMjqWzuCTTTvaP1XeLH17e3bwwhmm78K
	3a6kfpVD1Vj7A2xINdaOG7TLBk/9Q0fvnPfwYw1MwiusylSxly+Cwj7nojGmBeXB
	ckpTUTqiC8/4QnYva1YoxKzSoWEmCvNezivRLfy7sYoIgwiMKcKq2rJkRL2a32BS
	v6hwZaJl0gqTx45iu+exi8HVBgWthUeFqnOMk7VhVBZ/+a4wra8VTADk/6D81Gen
	m2Uui5xYOH4eLO89Xx+Zn0TK9pHJb1M90Oi53VXfZRZJIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v39dyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:09:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so15130271cf.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787908170; x=1788512970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntgQVvTOIQGY8J2ZeSSGFzBEpXgFIQN+dLFgAr5cAXw=;
        b=AmAasHwGKirPV2We6wahu8SqCZRck1TbiAAUOgcBdV1Hv0mRQWvwfKRYE6tDFax9cr
         oz3vO1FuwiClZUx0ijrjFOselddC7p/TbzgjoojEw0+sB6RIGGDLkPbY7mGZGJMu8BrJ
         O3RYdns8oXV61Wp1uCbznuN53l9FkSCkibMQd134ANA/gxct9mE5HD8Mwf28Hc4/d82F
         w5Y6bggkEDZxFKZxfy4HvgH1nHYcNiLY7D/PUgEoLPgtpeLnUzm6kyqIssL6WysLiV33
         u8iS+3IVekaBb+DjhVbTDTrJiFfm3zAS+rVD8izTrBjFTaptAGx/D3GoZieA9+pBG20/
         /lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908170; x=1788512970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntgQVvTOIQGY8J2ZeSSGFzBEpXgFIQN+dLFgAr5cAXw=;
        b=j+cHQMYCkQB/vvsQFFl9/qlkzF+FNX4b7WVzHMD0hHCd4aGttWsoBWrUvGadl0PBm6
         cy7+NL5gQFk5+KD9fXYrzNVMSXaIcs1I7tgZlP2c14LN1Amnh3I8eYemb7vk8Svm276I
         sVClaJ9R6Z2+eYXxt8uUMM8ikMo9dgw5WvwCsSLRln1RyizijJ6WuvY5TIOFsWQF0j6l
         ejL8OX0r0kzv9uTIJvX9Io35AmFt5T2zrVTNBXu6yxErKtPVd044GiIcclJ2POAN38tE
         lznZJVigyEkJBlP3V/WmHCSsnYMk24Qe3eF6JvnfcSBjAHnniPPcoDa6yBo5hyjLO7dp
         L2bg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0o8aF8rlpLSN+GZjNa5W0ZpGUqZk5j+Nu53lK65pacXX9RZhH9FffaGqJ5AVlJE2iL4Yd3aJAC6WC@vger.kernel.org
X-Gm-Message-State: AFuF++m0SoO7apHTnPg89Iz1pnpgE1xAcaEDdiOnlYaK+Gwvj3KFXWON
	YCmIpVnny7d5ypkZn1OI/zUtbK+uLanr8XauIVBqB6QyhhlCAe2oLJWg1M2n3sI9z3zm/33b8rM
	v0TWzGvePIVcUuoAR4Qz8kD3JIuPfKMJ2o90q35sEW0AuNuJp+r9s1CSONOW9PBha
X-Gm-Gg: AR+sD126grxogyyomLvsqzKG0oLduD4NlSTtPKKajjrQsTOjRWOgjrs7sBARopEtu0l
	sI+LBQx0L2Q/B2d8px35UzkVl6//Rqs3SzOJ7gbJ9rb2ef94z4yOFfpvHq/ug+B48OeLuOcRrIC
	H8MdD08y4XmLBdMol+MJbEsI7f8eQeHrsLqcrZdR/nLnsccY8PGGki7nhDfncWqOaLsU/5/kHGX
	zx0H7Y8JG04mGYYy7avO/K4Pbd740Q5s1D4iNO74XIAAPWTuOYEUJodRpOEUPrnAx5sbpEnYT3u
	cV4KSSgu9ABeiL0+8bBbwAHCJkmI3Q2PjnDmfhcT7C/XGfOw+zWsPZ0QBG116Dj+RGsAnzTiXFK
	SNrsFY4/t2AEe
X-Received: by 2002:a05:622a:5591:b0:527:7842:72cc with SMTP id d75a77b69052e-52fb965b596mr63617051cf.39.1787908170355;
        Fri, 28 Aug 2026 02:09:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:527:7842:72cc with SMTP id d75a77b69052e-52fb965b596mr63616551cf.39.1787908169872;
        Fri, 28 Aug 2026 02:09:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a8e0657sm10339485e9.13.2026.08.28.02.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:09:28 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:09:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v13 6/6] arm64: dts: qcom: Add device tree for Nord RRD
 board
Message-ID: <75yyfte77zwekiznfgo6z6ig7wxr6fz3vuhjyk2yqgo6x4hmrb@yshpp23uqbu7>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
 <20260828034958.3165-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828034958.3165-7-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfXxD3S7D0Zl6js
 /ru57vAsXmt4J5Ytrrr78g8MAo778ClhDJyiINaCUVL/Zzukps9q4B6zvhOk4MoBfGMO8783DKJ
 d8kEw8R+ESj+NN5XQQS2apPqyn11Cwjd/CqRb/jemRK7g+owdchNKYEdaSYX6rig2b86DXaihi4
 s4e6d+PA1oopiHg8iA+0qcRB4gsiaLvsLHy/QQ5r8XQsK4FuF/Zkf0KpO+Jr9nIDvStE0rlfWBe
 GB1nG4oUYi4HBDO5BmPgX3+h5VS8EqMTy8ZoDyOw1M7zsQVV3HSCnf5inQebFXT9TAQIEIe25vA
 vdJWTbK3+fDXj5MnShgy3DcCKPhKyOPhYRbxEfFlpJAgOTQwuQqDdlAVVaMUurKEFQnxbWAGxqg
 /P5aMU+0mcOjNfJucoe+4tAEDXvEZAB8Z9yPnACKpzk1ql1QVdmQNpz/QF2d67iBIRBRc5tZzQH
 rlqMwmZlbfSmzEI6+Xg==
X-Proofpoint-ORIG-GUID: TuTC0Wa4_SLQvz8O6vIIdEf-B2lLsmTl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX/NFaxAVjtTT7
 HogyeVZnE6MaAVV34gi3z6WW6CsV+JGXW00+Ia8EYcxMTwUUBEpw1YSCfisG2gvK/A6uGVWSbvy
 YzCZZ17eaxF9CnxwnNYqIlucffal3go=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a91504b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iJW0tgSoxAKxT-fYOhoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: TuTC0Wa4_SLQvz8O6vIIdEf-B2lLsmTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280077

On 26-08-28 11:49:58, Shawn Guo wrote:
> Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
> Reference Design) board, which is built on Nord Embedded variant. Enable
> the debug UART, UFS storage, PMICs, I2C and SPI.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
