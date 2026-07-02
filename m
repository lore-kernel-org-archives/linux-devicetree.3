Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116AF48B372
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996267; cv=none; b=Bk6xmMYyQCsT6q41nMfLpxIZpxi/v/laBk4Gp2fbh0/4PN6uvvxfOrRcoTRn4yaNE7glxOSNnvC7Bw5ytPTtbHahQ9kaJo7C4J90GhA7NYUXli6t2DeuioFJATkCOO9UvuHFm7fSd4GWSKXdRSeyMsMqXL0F9QygbvjZ8NQDrtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996267; c=relaxed/simple;
	bh=rlKrTAZN3gpbDf7g0AnbOsJNgR1UGf5weUdB3qLKjO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgLuljGejl53ccjtFq+pL5+HpKg15q9X7U2zDMiELjUz4BLrAjO3twmvV8eN/onN6XBaWN5Z1Q6mRn+ksnN5D3Qpnq4P3rHp76AeRrqWyDfOjoo6MjE7+tJMnanugP7ttO/MsIUwhivM5Y8Yg2Nrw9NOseDGRrzYTnPyvNBRz1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ik5rPaGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRh4rzUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ik5rPaGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRh4rzUf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sTq54172791
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBKHpcdbns8eW5+iCQrliCYP
	VrE+t6hY73SlslwPEzo=; b=Ik5rPaGxSMMCXOuzDZ0p4al1RV8uUchNqWHFSPlu
	8+UQNrgBhyPAeIjDY8Mt99SoR9eZgxnG/UDRf3dNNRZJ1LSm7SDwJ2RHlH94fW3Q
	v/ydYWJA7UAK6NdVX9ztqInx0L2M65vC3S24gJy/9+6tjyuIlgWYtCUDq0FkcGe/
	znAAUKFZkbbvSgszjbREY7OX+ki+usyw0pa/bExCCVIndmZhpxq05BqhULNYT3ZM
	VfuXKI0WvAuqK8Qg1OdAZhtOG7+ZZ+K93Uh1/XFw+L+J1g90ssoTu9L1nMu7pQYF
	3fRPIRZXVrUrgilHP2HCA0QLrpC2+CrTbxUpTJ1X+IYFwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwrve2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:44:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6ed4fe99so322674385a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996264; x=1783601064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBKHpcdbns8eW5+iCQrliCYPVrE+t6hY73SlslwPEzo=;
        b=TRh4rzUf0Dko1GmlQjOM7hKRpd2abEbPbzzWxDbceDO1SSKvhtg94SV1Dg0LvTxXlw
         zO08F9zAAWfdVs2CZATAgyrQdRa1UkFmMqCHuVKjVXtHWrcI4O4ho6nYSnDsGueTg0Lj
         e4qtlnLUOtguGNLgLHI+GlptDMAd7+zNhGVC8Ssec6oqnMOCvFAmvysBWtsYeLpjsG3q
         EdWFskUmTOVaxnYBoY86suMskwSx1iXsNBz19pRSA3jua9QJnNmWQbOFybF7nvv2gUG9
         fi6Td3GzuBYpwry7ofa1Tl+oGpgdKE7P+UfdraGyKRypXQT2UJ5TI8kn+wrKzqum0s6M
         URAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996264; x=1783601064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBKHpcdbns8eW5+iCQrliCYPVrE+t6hY73SlslwPEzo=;
        b=pFFxZYY75ET5dyfa+lkUMTZpo9ueu2EzXKmnszbusoLZ/WXjhNeX6HqSN2+fRDVQa4
         NIEZc90VUZrOOzmN057s4sUQreD7l7E1Opkry7DZGj5UiyTl0LvGagrcpQemhtty9QU+
         /D0Gkl+guACv0EPK5+pfQiIOBqTCgpdqTIQAsXfff4PfJmo3+UpMcuHKeSjSUD75gu1w
         fJ2gMVFcsurLV8R7zQbQnjB6iEW7X1irAYLKO5MzkV/oKujeO/szqxm8mfuyhJMvo3pw
         pX/Vpxpi4/aDs0kmuZfO6efO7ILIDGr4D3uCvKFVkv40qBE83GRExqztxTDYSI8SD7MX
         TezA==
X-Forwarded-Encrypted: i=1; AFNElJ9CyjJaWzOTmOvPJB5iwP+MmGUUKOJPODD8oVHfkWDoJBR084cqIJ30ns5eWfm6nsxmdzgfeTJzMAYw@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1vsTwR//k5tw7RL51pXHy7TU7DzedOO7xwLZwEY3SjXrhGAJ
	LCCegryuX7I9S1hyjjjx4ufBQM5+PWyU39nQZqaCkfwnwXw0oqly1s2t5OfTG9cNBOvPM1/QXFW
	JWbTi3sffC7V627LeCqg84IK0Hgi1dPV/PJz6z0uHn5AD/wqMHOE3nDXzSUxpI/xd
X-Gm-Gg: AfdE7cm8L2nVhcHXgWaaFZTSOek9B82n3pC9O+U2xZMOZ2hnIjr/YT7reMfkv16qvfq
	mFUXr6fUEOxPeNWFRid0j2LGhUgJS7d+c0edzYM5Q3QT74I22f1nF8QqM7/ew+1YdfP+1n2wvu4
	hNP38ogDB8c124w67FhHDw036TttRTM/UdvBg5QHxEVJYTaP8/T6pYLxAPy7TR7vbDqwfR/Fj99
	SCX9rJgsGgb03JLwTOj0xIg8inXaeYAGJynB8HrIvvYpD8wiLZdzruAr1XghtJFXpyuqLdJAM6h
	8Smt2NCIkJd4yWw70vAkKHshsI6XAVcoRlbw7AlUgBdeDkrvnoKJEbne0yAyVpw5bXywji2q5V9
	4/84dsW6IhT61yUwIgmy4RmRGERcrxnifDnUXAQtOv10DFhtlh3VdC31jEvOe1zoiv9wcujfpJA
	dEhkeG8YklQKuyY1WyODDpLKyx
X-Received: by 2002:a05:620a:a217:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-92e7d1fe420mr488517485a.31.1782996264340;
        Thu, 02 Jul 2026 05:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:a217:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-92e7d1fe420mr488513485a.31.1782996263809;
        Thu, 02 Jul 2026 05:44:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc2cbsm666470e87.64.2026.07.02.05.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:44:21 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:44:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Message-ID: <pref7j3djctb4pnvmsxvnduaw3o7vtwmekq6kbgfokwjtavt7l@cbsjzpivu7sd>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-5-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702094056.3755467-5-mchunara@oss.qualcomm.com>
X-Proofpoint-GUID: pF8jFtrdxmdQjF0HowLKyKY30HUrmnCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXwUm9gt0Rq75f
 U9ao2XI4fADHg5qY8LBTTe1rrDyqIDRyb98rzaHZtYZCXkfnwlct/9S4lZdCy0iRJMlXga7Nrui
 HauA9hRslXfUcMwMHrYuGR7V78C/OLW0F/Ob0CeuFk6VwpoV5CqcD93QFQYjBEZe5HNQXr6FnrB
 BAeayaSk0/7gtEYRd5ET3qmTT1H4zqwCB7NMaGHZypZGOtB3wTbDZLHtvJ6jmoKtrumdgKa9Z2E
 Cy2HoRRyKvF1Oyyqvwf+B8PlPaTFrntxl++oJLRrRO8jHGAw8e6XtRb+wUnHJzNuob+Kwt5V3eO
 dOQdGb8CfUT0APVaO0RKWF+Vsng6Gdf5UsyNiux55JvUVNQz6tN7Wnbrg4bZ/asEQwHYsfCSpfJ
 h6W0qXXndPi076bmjZ7vtvcl4mLl/YuHODEcQ/A40hKkplqB05HTe06Qz/j0eFu4hSUhokA00M9
 fDgsrJYhWKIglKVniYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXylcXAWEsRgn4
 /ayytgr2z2yrNmFugVwbjtl1yy98nc2IxePvm2XDrSEGVAhjgkG0m8KWwIUkYjJzrX4X8pAj5PU
 bw3D/wVodhno38kkMQdjlk163SvkF2g=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a465d29 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FZAofsGHiTNuLk9495wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pF8jFtrdxmdQjF0HowLKyKY30HUrmnCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133

On Thu, Jul 02, 2026 at 03:10:56PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
