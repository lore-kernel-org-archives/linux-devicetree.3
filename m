Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF33AFCFF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337854; cv=none; b=KfLo2jfPF4cLrLQ0mSB4DLy6aj3rOaSBGaMJoyrPVg+xqFvNnn2ddQJZ7YNMTbK7wD3HOC9xI3iudgYDlDOH4dB1sj61wN6V6Yy2Vq68almL4KwNnzl4Jev8VdtW67wC1hPdOec1FsxsuopNaPefD8ndmoOI2zYC7cyY7XIVIK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337854; c=relaxed/simple;
	bh=T28LwLud2iEzbbgwesgevDXa8dhLYQcfSwjwDOvg/gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC2TViXragOrpeXMVvtdWSFNr+c2yDJ5WodSg6Y5jmKC8JcZw2/rTyov0VAaNX+gl89K1HzBmZdUX2Xdo02GFRQU7AXj5tq6AkH7/sNEcVkBkI0rHDM6QEIxi0SR7ed2qnyvJ9GDeeqWprY2OeL5bxnzZPOenN38Fh5t+3BfaBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXntxlLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dolS7ubN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXntxlLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dolS7ubN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF34Z42357655
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3kDVR16cPwPN/H4xAF5SCh3q
	n7cgx706CeAbqHCaGCY=; b=nXntxlLPp3xOVSis7uv47cgc/ZazyDy4yvqndDrg
	kWFCf8BtIYRZ1xRYbqKytEul0UF+4zJDmfVJwS34s0s3iA0u/sLQmbCMlhZMWn3e
	R9wQ29CVB6Cu36a4nY4mHNnaubrVb7jBwA5iVuLxkDpw/9qHOl/zixNLTu0/S4H4
	kHmmDV5gp5a7AhM6/9+vEjjE72avo05qxg2meYQnGcnMDJcRbywyZHfv1rLoe1qr
	4V+234SvpZZx1HenpYDqOCOAJ5/Apl8tDiS0zqhLkyDa6NY92CbGRf7Hj9mJ1Ms2
	fHrICKT4ov0Hqiv4opOC7yBnHV1+AXqP0ZuUT/jCdxFl3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe98uya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:10:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so13614511cf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785337851; x=1785942651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3kDVR16cPwPN/H4xAF5SCh3qn7cgx706CeAbqHCaGCY=;
        b=dolS7ubNHK9C0nRD+i997wUXp0qidBpYE8MyBR6wYgvXL4oPAdVEx1WZ5aiTyo2JHx
         c8hLOFA5H16AcL7k6sTJflrZq87++hljHdLjIS8fDDH3mHMLomxctKEcIa3DrSYTqkQJ
         wWmcZ5bh+5KGntmU8jq/cBRF9Vj0frLDk0I516ktWXkYo1gEw23PCRmWrqGn708PWPQi
         Elc9piRjH+JOJZL02PlsrA+nzQLpDGdRfikElduXmCZO92A4a+iGBm86dMmQH1C36YaJ
         6YhoOzstrC43HTSkRPRaMIrQLYBgpo648/d8mKlpMN3uZ93NM0dSgsAFSUR5VDxXUKY3
         D1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785337851; x=1785942651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kDVR16cPwPN/H4xAF5SCh3qn7cgx706CeAbqHCaGCY=;
        b=QOSsJ50/blVr/dyubugjYwJg4od/ww+c1kqMW1g1p0LVs4pFwvXpced61Ys2CAPQlG
         y8Qhsco7jb4a3K1Yh4e84Zqj0I+arMH8vuCj645qGDwcnABSWuJt5bCedLsXqYudSgG1
         JiThoJov9ty4yUH+cPxZCHGpCyTMGuZYs3Q7T3xyLHBbr+VIDPzFTUgTnre3bS2BR3Hh
         t9AqNB4hsjz1VWBB5rc4ulz3OuWD1sJS/AgeDR1EegWMr3FCETo23XXbcy4frAE6aNu9
         4ySDB0OtyBomFUKF+DKw+HbFGXr2K5Vhz2qfHyCNcEP4RV3/6PuKsxAkfEGQfWXgSVLp
         cXag==
X-Forwarded-Encrypted: i=1; AHgh+RqmNYr2Ouze0BJYWiGSSYHbGT1rqtd8u/JR/3zbfD/OyD2fRc/RdMm3+94TOTKde0pmdqaQfdtmz60f@vger.kernel.org
X-Gm-Message-State: AOJu0YxOL0bNOFJ1r1WPuu79EjDo5x3pzVtOvkc/rMTdmwaMZjh1Duui
	QwDmdPwcPmfrby2fHYwCC3CbgT9T0lIaNRFR4XRpNLIcs79+BKGye7njPa4oaBZ+i0PC+x+ED5Y
	Mbgxq/m9nYsP6MKQZGYl737wHFCw33eYNSf3NJNVnjAwJ9u67ltkwkV0Ou9uXmYvK
X-Gm-Gg: AR+sD12E3zi4k+So+hhF0Ddi7PyqGctrUuiV263PJ7xUVGbYknEsVSGr3zkS5TFtA53
	E0X1ckSsPjVrpamDqjWcgEGuw/gP8PyIY7IcqkFo+G4GBXnccGD/NI1CdSpjOs8IsJJVOmD5kVV
	smCWkhB4EQsmeft2aSfjMCxdZ+5HoCWTg/Yfm/h7bp+mQOgC9e5TQQcFyGYuVW7Qhd/9z9+DStD
	t+wV0j5ZHC09yWXSVdN+SFpgnKI9k+n9HsHswsd3vci8yEbNa1++vzwVkh3WRazt8Jmmnyoygfr
	5IBSp26Yu+vOSAGRNmRIBQKEZUWInOzGZfs8r/TxBIg4Esu06NoKXA6lP5a3tWDNPQ0uO4n8Qlm
	Sp/tAOrHPwKZ4ALw=
X-Received: by 2002:ac8:5acd:0:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-529d7115a62mr61467701cf.32.1785337850889;
        Wed, 29 Jul 2026 08:10:50 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-529d7115a62mr61467081cf.32.1785337850054;
        Wed, 29 Jul 2026 08:10:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bff4784sm362740695e9.4.2026.07.29.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:10:49 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:10:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: eliza: Add PCIe PHY and
 controller nodes
Message-ID: <bfqbdommlswjz3hji65hg54g6eiqtufpljpa3jdvqxkhsu5uso@dfc35pmlcngg>
References: <20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com>
 <20260729-eliza_evk-v5-1-41790a5a24de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-eliza_evk-v5-1-41790a5a24de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMSBTYWx0ZWRfX+bz/1JR5Y6lE
 h+ocWtckNSCYMvWZhV3dUyyinhaUh3+TL3cFjfAks0KWrE7DAPPPLrSCLveoSS14//EmLHCcdJu
 N6HJT8BZ+CSEtebR+ltcO8xgrSoVxyfyFxlugQWaG7iN2XWLuLAVcZXyPLoxupwCGpg5He/OPS5
 00PnkNbu61kgTFcjxoSUr9HTXyDlZpdl7fYnmTqxv6Lldn8TZTrlnOutAfcB9kwtmz4Vvm39KbR
 MY6YDWgTU9oEFzz+J6/FRCchvRGSlBkXgL/iRr6YKdcilXd2rhKW1rrIdJlmh5H1/6i63U/TSCj
 hWLwznGZ3XEJZPunFMT/bYnyWSLw9N4lTT+kpODUlT3cvq7KYQKgSschK6W9ZDD0NJ4J2xmCvU1
 LSkly9DbZ7WOFsf5s32Jc5fMRWviSC68SVZ205jUPlvpxVun2nmiHs/mw20PGqXyzB1G/ZbL2iy
 20Hjk0skjhgdFo1NJ+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMSBTYWx0ZWRfX8HGW6CHVy9Zg
 ihdGMp4VtMb5udkPv48eQf9BJbVbW0mcsX4JoJmdHCWhAtevQkshtKoong/UtUlAzxZySiTGaYW
 h/zIOyxn55TOuwF3m1bfT6CLMFEQBmo=
X-Proofpoint-ORIG-GUID: SbKyc05R3vYP0PaA-w2HSYdrxCgdN5sd
X-Proofpoint-GUID: SbKyc05R3vYP0PaA-w2HSYdrxCgdN5sd
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a17fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290121

On 26-07-29 20:18:36, Krishna Chaitanya Chundru wrote:
> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> the GCC clock references to use the newly added PHY nodes instead of
> placeholder zeros.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
