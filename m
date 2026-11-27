Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758334;
	b=llNVL20yUqBy2DZLF4E00ueOlWWjSiF0J3Q7USiAyufCap20PfehTB66wJd6PnvzKO5C
	 ZKC26zQWzwCYEoYr3NAh4SRQ3dXIPUbmP5pKF361sJwWfpoitZj/O3OwkvSrUH+xTXqjc
	 byfAD0kdjKg2Q5o/Fla4qGmFKHrL0+gQPsUR85fJXJ8TM353Y8AdU8XcQX9MVQ3WhkcU4
	 Lb1I1Ba/GjXPeganXo/6fG0PD4HjXyOSU7DMcdwoosmseUWqrGTXBP1GQU+8UYM5dmAoF
	 7Z+pEbUguY39tBhhd88moOCAxbqdt+OmzscqgLk5wtGemjvXhT2zCev20rAAfImULfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fcD/0QzP6Uu5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=;
	b=qmj5PGhlrd1mxTE2VvK8HlX4cLVaQT3y5sBOMcT5f4Fg8I0cRlO5K/RUY0iwjFQNjbWk
	 O2o2Un9wPYGvJXNxXacJuo4EygCKJOQm7H5H0XG504EzMCx4zJwpsyZk7C1ECNdLDGNen
	 aN6j2H7XVFF1XF5oHHplXi0+Fs8zatV7ZpOIPzOfHaHZaO1ksStgtJysXCdPzuLjMOzGU
	 K1SpMD3tDG3OHPsnVsfxppaFILueZgXO0AY4K60IaBxYYPQ+GtEDaGzocK5Tny0IFF3Dv
	 2sztWdlQqkucClxVWGlEA9yOnyn41Xmxtcs8OPLifhnbgOdWXDtEB96UrQ/oAQ+diGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2RCzZ9n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfSpOohA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71040606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71040606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2RCzZ9n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfSpOohA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvsV12573539
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fcD/0QzP6Uu
	5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=; b=F2RCzZ9nTr+6BRavNkqkUYuPl1i
	ViJPyC92Cch2sqsX+LbSQNCy85D5SY5gL1bETmtvM0KM1GHwhNng95mw89ySDb1H
	XuNVzIiDHRZ4skoKgNgYuGJEk3ye1E2k6BIL0ygcWsUETtqLWgv1dYR0GlZhfE3G
	6tyjxLcZvuLOKGuan24OGeXNm997Rj+HzwdFrzsqBx3H6gjZs7tUz9NGLu6g2EG1
	UZXxKCbu2B88zFya7jEpfel3RDh/HWOYDIPuBF3sfxeuykIBzu290qJxxxfMHkyC
	Y2fe3dLuyDKaKd5BM1KpuvXsBHbbX7eG5Xj9QLFKiEJyxU8jk8IeM+GxHOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u499dwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f033dc37cfso72936985ad.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758333; x=1796363133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcD/0QzP6Uu5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=;
        b=jfSpOohAoMsCyaNNmcgedkwPyz/e+3hlcKj/UceoZ0C/bSzOhwcHjFxl+bvEQkmwAD
         VEhum9HGU6PmY6aNaGRrWyC6QOxW5nrqhpr4y4TLAI20uRLxhY7pl8mEwGqLnEkBvQpT
         wjQ8g4Lh1kMHx3rWnwju1+uyKBMqkyUamNnhSweqjKzwkyw5QEEVt+IicKmJm68stjMR
         iZTVxX20ElTHxmW6F86/o6nTaOKqgB0n5YjV78UwbPDkupRdlESw0FsJLPMQegPZLAjn
         IFdVGb8r8cI4GAb1N979uAIZX3Y4iSSJljI8yT1760X3KmuJqbLGwxM5b39tb7VGE/Em
         S3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758333; x=1796363133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcD/0QzP6Uu5TJMErj6mHvKcxrHhKf5K1ci9/BYkfZ8=;
        b=ZTDdM8KL/EM6FjrCzUyEgMpk8VJYQ0Bc60C7rRuo6/KAcwwsmmpoiPo/5VBNgfRcvF
         9TDQ6vbq8wGIXF+n8pWkeQ05xqEDtSytDPBOJFc2b4ZRhCmBwKusw1gPhtPzck5EQkil
         tiPnNG3cziZCrzvuvSZhK/pidblSpEc1/o6t9DMWH+vYS811brApc/Kd0vB4W5Jp4vnq
         EOo2vlLQQFrRc/HOrxJnsHm/RsQNQrSSUIuf4moeSexz8S/SSyNPck9+n2QJurONush3
         R5hjcSSEdPSnDs0bfnmuX3Gbx6jYhK7oof09fIX2tbfjSRYritKgy8wgfvRa31SoaYqj
         jQFA==
X-Forwarded-Encrypted: i=1; AL+hErEJIsKaX1JJPsdo+TaPVb0ON/UGieAbyiCK4m17tIDzmpwX7h0idiPLYq7bzGSoaZWvceA1NBGU6+v9@vger.kernel.org
X-Gm-Message-State: APuU4Z91Crg2KFcf/OQjFfa8gvg+NmKA5X2FUgHzZF4tsaOgz1l+iX3a
	Yu7cpNiEs07uuhL2f8adg0lfRhuv6wK+kJRs83d2Bv73lOlPt+ffu7KqbDoSJuaa1rLOjBAszw9
	fQetY0UBHNRfQB7cc4IOnTKNkrEPcUnntxsSccd19wgM7N2/U8UOSUK1S927EKhvc
X-Gm-Gg: AZFdTZfVm/90DOtfnmzGrPm6WNhqrXOfpfOvb3BsfDnlYdg2zW8/JVdx8nTfBky0reU
	zG5G+8KefyIkvpfEjvm7++UU7I9194ewD8iEe7LTp9yhyVe/V3FTXeTrvmtOpFKxkBLsulqkh1m
	K102OqdqQob6uO0Z4hQ1cC7p5X7rXVRxK15BvJ9G9FXUEWR6lYluAAFYpDV4qX49CAH+e8qLRak
	u48nSz6/09KlrwjhUz30JvEjt/afykuEkztEt6BiceHtE0RCChbxcOzS/ijkGVpvo4+NquHWxAI
	gpy9haYVoo+wDHeWHDZDtAAaTiybp5XquU5iRTmlLev9L6oeGtUCSWU2YQzR60jbpVbbGQIoZf4
	OElaCaChatNcKYSa3TtAySFAsqazQyYu+Qo4TjIDD0L1FkSXoezkILLub+wSzmzCRKXKAWSF3
X-Received: by 2002:a17:903:32ce:b0:2ef:ed25:514a with SMTP id d9443c01a7336-2f03f16ac68mr227140305ad.44.1795758332796;
        Thu, 26 Nov 2026 21:45:32 -0800 (PST)
X-Received: by 2002:a17:903:32ce:b0:2ef:ed25:514a with SMTP id d9443c01a7336-2f03f16ac68mr227140025ad.44.1795758332348;
        Thu, 26 Nov 2026 21:45:32 -0800 (PST)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42a6sm114418385ad.23.2026.11.26.21.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:45:32 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, srini@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: nord: use "hpass" label for adsp fastrpc node
Date: Fri, 27 Nov 2026 11:15:25 +0530
Message-Id: <20261127054525.646822-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
References: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fPt_Jgb8-VKZIE3U6UDMMNNER9syyrda
X-Proofpoint-ORIG-GUID: fPt_Jgb8-VKZIE3U6UDMMNNER9syyrda
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX0Sxyep+IZ8oq
 cOnFprUI1FsaOaiCXPksxLLA6VXmhuSCAIm2FV2Lsc9lCSqb/Ca126gbpL/cdEP2wDWfdXsFuAd
 6/3LvJHImkYbuMXI/92mhyvkXLHZpn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXz+2MQTClvv00
 vCpQALfzs+Y4Ebn0E3HbdTVWrDw9OZKfSc9EpE2WHgl07Ql3sQ08DqTGAtvgDAv9NDOJ4uv1jrY
 rX8yIKoa01oOTn5s9FhBni2N/AJGsHPxV2UErZyqBrY4d9jmym7Wb3ama0XkWblcjIDQO5GEXcO
 w0U2SP+m7Q+vFwg5hk2BWpPHOQxCr3Z0HZJ0+tpL9qyJ99ouDp6up2Xj0S0uvsLTGmLi2CEhIlU
 TvtSssUt5Hp5arg7mzOdBze4Cvx3puzXz9G7xKH+8cN19Dhhqq15B0G0vxsEg/W1kOep39F1Si6
 S2bOPlceR1BbThj/ZlLBFq89THqZ/zMOYHaRCiHhJLrJjHJ8Yr3pGypuvrHJhGprg5s5feacghm
 uVgNz9QVrmA0xJQeZtnSM0dyTmiBVPIGqS3hIqqpPDA9fyuiB0XK088twfn/mac9D5NCrYz0SaY
 ojY5NupTv9M9YwKn34w==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0918fd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=HMxxIxWglf0TOBfGhZcA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

I'm dropping this patch for now, will revisit later. Please disregard.
Thanks for the review.

Regards,
Anandu
