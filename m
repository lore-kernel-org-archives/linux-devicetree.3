Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDF33E1723
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913220; cv=none; b=MCXRp4jw4AjQaj+Rt85YGco+0A/XZeCQddiyWaqOLEWw8mXXTOVLP+hbQFpwOFX883qLYi52qQG/cx8wZDFPBnw4cux/HTzPXMC0PbjXkHT5sfzap5lDAoLBVtrfR7XniOWTjgmfyH6aeM5p+vakfRHTPj8q3PLB5Peqo0tIiME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913220; c=relaxed/simple;
	bh=/+FOxHqzLhnZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVwt/AMaLNz8SWp/juWSlYzfXxE6xn36iMIQiV2fCoh34n81Dn87QXCpw+onVgR8VARZcjOznZmXulb1S1LwbHcUInkdWNn2ThM5eBewNzbojnP1CxIEjhwPogy2yvEGjPfdVrSI7w9z5k2iU1tWsnLpSP7yHeicQNzyxUc7aH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOUv9V3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJkDEMoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOUv9V3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJkDEMoa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755l1em3143292
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 07:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/+FOxHqzLhn
	ZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=; b=JOUv9V3YMDmsIGe12gJZbto2dhJ
	+O/6dRH9AW/Qv7lTNsUaAkYI87RbLcXjIo7zzG4RaKEo7/Yzvxp9gbigdrlZXZ0o
	r1rtYsqCIn58Nx7sjGWTY63I75V1OW5d3b2GUcOiUYNuuNdIBBMLhaUyUOcvvYSY
	3nPqkJvf4xBX+xaMKN8c1GSUR2lNgPLCarboLy1A3lfBGMVqtX68F+Q9w4Hzc/Xt
	4NTockKP+DdRXyzb1Nh9GuGAr+th1UPM3to8wYjZW/Rb7SYgtNcnC3dUPnGGb3PL
	wxwBRWiRkvO6BfbxwvUGmq2exgfUCrw+ESd0BAn49PW/QGrGLqdW5cbSkvw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uh90f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 07:00:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2383714b3a.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785913218; x=1786518018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+FOxHqzLhnZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=;
        b=YJkDEMoa2o1f/x7k8QSgCe9ObYlG2VHQ1FUBHYv/GNBtYIGrSFYg+heZbP0WXmx5Lv
         8bJAioCnk7umwjkmDvQx6ZRJpo47iCSKzt1KcrBJ/PHSxuJRWIAzUeKqNPlg0ZNoy55p
         49XHKcdgVPTQ8IC4alNJr7zGLyq7bVIwkX9qV2Ry/NpiT9xqhDgmNBqM9HZmVWvrXMZ2
         ZZv4QInDzX72nzZ1UJ3lY1GeS5cOM1qZL8hVmkq18O5ZHBrZ0wex4kv9LsUqdhQWSqcC
         sJI8Ke4tqblUffxLqEtZXiZTghecqG+XNyK+p43WftrXpVEqXZjh4PavAgWy1pghhHwt
         SX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913218; x=1786518018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+FOxHqzLhnZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=;
        b=C+4jA1B0YPruEMrAiW4c4sh4skuyVDpJ+QwjZJjmYxM3GzLZgi710XNWTkgFiJxpcz
         EoyMOvwFpiMi/YEcM72V3DNLBd+HnSxCCnaa3U9mzWOjRJ4hPZBCQZEqcy76qhS5jaLP
         lGxO07GGKjJwEQoqzNwd/I0wSsEHtneyfsf5MIj/RYI8RtvSEMBaZB1Yi/x5CFbO8Nvl
         mUHeuobpFeN8xI6Ox0Svrty6DyDXzUmEL07/v4/0MoqTuzMxO/E7ldas09iQSQ/AKmkx
         hxCN63C+zHGo0GSekGBVZyM0KmQe7DCMt5tDU6caYpJHfWkudVyhMKEQwTdceM7rcf/n
         U5RA==
X-Forwarded-Encrypted: i=1; AHgh+RqeClkSuE+6ibo6/4nq5pjBwwUEaes/TmHvmysT8bTQXXtd01PVilP6IRbRPmuIr0hLab1rufpju3iH@vger.kernel.org
X-Gm-Message-State: AOJu0YwAUEjI6CK8X2sJpgRIb0K6snbNZnrKrqyxVjQHJqbv3plAmu8s
	cYZI3uXAA2LZHE2CD8+7dv5MgZLxlUOdeF8KnvG9Dds53vxmuzxp2rbaWPmexzeCvU1XcoHfu79
	Nz6rHDeNPDRjpey29zV91r5p+CuBPUELP2eTnE2/BMYEGm0MjwKDKkVHVTLlbwaC8SKLAC8qn
X-Gm-Gg: AR+sD10+llzQmRVl30pyFt0/PpW/fWSNLkZjCeHxM4nXCvWOnpRck4n6olyenhYUBYx
	OoT+/tmkPy8/YFZ5XnUfryM6d/WESzumUm4tP6IPpJkdSES8mdVRidzCkwHJyBtC0UVzyqN/vdl
	W+xqP0inHS4eVIw0KzKImED+/Lj8goob9u+dbnWwTMfz9rC+DFtBtS6yFW6ZXIQk4vB95QffAWu
	glHWsljIP2R4FR8dVF7MROXqi15ljPghu4htr1kWsQNSxYr7j4jO8/5wVsQonoI0UUlkxEBN4x0
	X3lvWupIf+0FHxuslUlSBYAJay+XKQ3fBW3TIogA4kdZ+rTWAp7EgVM7fG7WmVM6NIYy+iTrilf
	TX7+TOGjuC2L3ZBdewJTOjHV+o5aehmqnZgyOjfsHlSskrEvdyOrPv+OikhuW6YJNM85sDpEIPV
	wal5qhJ8g=
X-Received: by 2002:a05:6a00:418c:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-84f1ca72e94mr8994123b3a.5.1785913217675;
        Wed, 05 Aug 2026 00:00:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:418c:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-84f1ca72e94mr8993965b3a.5.1785913217018;
        Wed, 05 Aug 2026 00:00:17 -0700 (PDT)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e5139casm494617b3a.44.2026.08.05.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:00:16 -0700 (PDT)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, brgl@kernel.org, deepti.jaggi@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Wed,  5 Aug 2026 12:30:11 +0530
Message-ID: <20260805070011.2921900-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729010022.875799-6-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1MyBTYWx0ZWRfX7VAqJBtfLjsp
 JFT3cU9m9R9Lij58dFaFS/zEUrh7MvfX0YeQqOz59wOeGCTwAJNTGGKgOYDFgSVotUz/7ilE6uu
 EztlSF+SVWXRJbMmmHYvRY5MS6UWyoM=
X-Proofpoint-GUID: sDeH1aOyoscB8G7kmX2ukTVJE9KDEVaa
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a72df82 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=a6JBoq2n6Cm8xmjqUjEA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: sDeH1aOyoscB8G7kmX2ukTVJE9KDEVaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1MyBTYWx0ZWRfX2xmpDu2XyKXI
 rMJsI3IX5eZllFdEe+w2jG3FkXZU0EmZM6x0q8AZgtIGQT3Cqp+io9mL0TW0+1yVclDKN+3XuaO
 hFxWqAn7s3wdRd2TxxKz36yDghvVJuQwmVPRVusOJMfFCzjH4Tjm3LOfBzy79NT/WvI8EgCrK0y
 ncO38CCvyuAgKxXV8vAVOrM13FTFgaNfhwRcaaObhhRjyiMEt7dVo9Mzx9fHL3Qm+RpgexMOGpX
 eEqB4vnFmOB8w/LarUvuOhgOCuFT6Fz9Qp7rsBUSpVUrhxgfNVAFtVW9rXYjFD9fgcsdWitU9a8
 B+6ws24gYaitA6mVS3LlHuAtPORNvhlonV9HHIsZfD/rbHTTFhlIhRg1XBgEIZGJHrqskaRMSuR
 ej7yoj/BqTfne7mPM38AXU9+IM8kOjpDnAALzuk3yV1TmKEM+BjRAVheddTm5GkaQyX32Z+pFxT
 u1F1l1JpWob0ROMc4AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050053

Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>

Tested boot on Nord Ride SX platform.
