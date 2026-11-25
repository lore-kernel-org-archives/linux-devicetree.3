Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600948;
	b=k5Vfvqk351GVzlXdc3UBnGAYYH0upGI35V+bvwd/jAehDe8FFZ5jwEnjLscgCiEBh9gW
	 MfXzCn4ynIlI46NScOoxGWDSzy/A22bkvxy9VujdKi6uu4xWU7SjqR/dUK1izohIDGNXI
	 k4Q6bCt75TRzGtQ+SzktZNYRwctV8UUeqfzIkuTuqVdz0EixuR6NlYI3PBhVgTFLpXgVo
	 OgCiaUO/dalDLSwHaPwur2stDxbtv6Jn4uFXsBDbaEMUP0EmHfNTSbFIen9EjMmO+I1mD
	 p0oW8CjmfUmo+GpC4qocTZj62eRMbCLT3XdEfY5oK/ksRm116Rq9JhihIOguayReG4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FFdL4Ia0dJSqJFQurPs7BvTO6zqp/840DW1bOoMT5X4=;
	b=H57uOCE5xenAWsJoXxuFQZX99eQS7zGTnTmnW4U0yWwTOjR+L343jrkplR82s95Yc1Pb
	 aJPR1s2WZ6mIeRQOaiBGX29zKO7Z7yx1G1qSMpSYugaGymy3AY77nvtHanHRmBHxMvqCX
	 snWAgxmaJSrS4Q6W0Ji2dgh853lewiaA8GzuDLTYaoE7yGbvgjNvGMsR80dNljepDtqDD
	 lBhDExjxWf7TRf5Qx08oRV8KLrTZXmKxZzzDTu8joML7jN8duh6bkZmm2VY+N0bsBWFQ/
	 2N2QS8q3wb1erc+9NT+vW9gbClBXY79Sg14ttgAcfZGAXdunZe6V67nlNQ2LQlFAP+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9kegcIV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbL+grm0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CA7606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9kegcIV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbL+grm0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mRnR4131759
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FFdL4Ia0dJSqJFQurPs7Bv
	TO6zqp/840DW1bOoMT5X4=; b=f9kegcIVW/jGsm25Nzp/3JIvXYcZk98WwWm2TU
	v+P25i4W93od76tFRaT3mDoprDEGUSoJEq+/o2g0Ctf6+CJCy8TGJ5FAx6Idwksc
	zobIkUMG1ECs524nXtfUyw6RiQJzLfbDQcmzipgMv1SoWOKh6JcwHytFrszbvdUr
	5ItlZfeKHHbRHQoQQPjk2Orl7oKwtntvNsaICtWoZA9Wcb3/MT8YM6xy28D01p+j
	lFItgpZpqyEk1ypb2PQqcpcUOsaQCJNXJW0Hdl0WN/9YEdtGfAOtqARn8tLAdfav
	ba++o+3id2sFS+gNsZ6FUSSuddM3jHGiKhUUZpHNJYX6nndg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhr8qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:02:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so6731959a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600946; x=1796205746; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FFdL4Ia0dJSqJFQurPs7BvTO6zqp/840DW1bOoMT5X4=;
        b=bbL+grm0aMvViXf1dK1TnngThOSUPN+kRvuihwzly2kEfajdgP/GzySq6g7aSjnYWg
         kyrr293ddofVpb/TaiTMJfvTJWvz8rTIl0P8PzuzfqQolQqbRVQ50JyKttHLn/MLvWqa
         QFXJuheJAUnD40PQXbRmCmvGcLvZFAce9U1ktY3jtHAR+Q5CDuEi67LVI9kNTennHj/o
         DZ/oHXKjn4Pgs6fC54dnBAmFY1kC/kJqPLY5DLKK2mo6ILRkYz4g0H9lEynPBpeVgQCs
         ETNmrpr9a+qOG0ND6VUcj/ydXVPjmJJ9o0sxIXYNB9bO5cH+MOdZ/WXNXnkNINfY+nSc
         MFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600946; x=1796205746;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FFdL4Ia0dJSqJFQurPs7BvTO6zqp/840DW1bOoMT5X4=;
        b=Ev7F6m3bzd/IL2C8QJ4NgbFbKC8+kZNcnpimUAvT0g2OADcaty5a1yqicdg3z71G9Q
         ap3+J98Y8H4TSjc1EqsQTySnf4wewmFaU7Kl7O7NlTyCwDnVJ3Dd7XbFsuC5LHF86Rsa
         Ft3h3l1JDuHwRg4YjtCeJfPMrKGC/HSKTYI577jikbHKcQGMkWdj4Arbos7c5oNX4FmS
         P+CVbM1XA1vvy+2m2OOt7pXxLtj/cBkyHhnRVMFT4vbbK/yk6TstbFBoEFahOEW3cLGl
         3pN4OQFYvI+bIXU9FuHFNOGgj1/TggtpHoaGSzeL5Z3FzikwML5G3h36zyLlfr8hygqs
         Zopg==
X-Forwarded-Encrypted: i=1; AL+hErEXpLQAJ3/bPdvIFYkn7CpGIZtwlB0+Z4E3DxJbvh0+QO9YRsBGRmdNAZXtJ2iBSiuBqGeffAptm0uw@vger.kernel.org
X-Gm-Message-State: APuU4Z/7wNQkNER7HifC0pd8fDjFF0jjb//7LpL4WRApXk9ctaTxgC0u
	Eb6q/8YHIXMOWNL1mxHz9XbpJ0W6XeKE6Gf4LIaLczKdXBBtZsPoAJIPhmKszQ2QqHOi29hGK32
	QLlDLYhopVKVNra+GmlXh7cEuy6yxFZjUyRK3b2/8lVqAytUIFjUL83rZkZoWxxJH
X-Gm-Gg: AZFdTZcXQLxo/ZCOvDGm+GVFS7CyHYxuuSUpQ6M6moy+Qs8N4AqoU5VflbZH2aSQDnG
	ghwvjnIpg1FEw+CpEVVJQsLoBaqgVTD5x/Ckjclu0b72o5FktyKZzt5VNrtF4+W+WnOLsRXPdc1
	nse/rtgO85Vh72ZwzxH8qz3SUy2kL0C4JKhNBf5D6SJXR5eu+hOus9IivfO1dAt+Z92BMrUU4Hu
	rN/in3xqIJufive0667wngTosfCu+C0J+CAZOuoUpUl9MB5H5smLkE9MzgC4rcosVniJz48pDiS
	lFj8hCUGXTCiE6Bn9uNHVNQ84iQ/4OYHtk4zuAhGYxxcZl1AZkvqK3fmA+kxY5qAWLPtpBdcxJL
	2zMiBaBAz1kS6L5wBNB7K2VJSZOBJ26PcFQSaBmMnQon56pJO/RC1q7aUeKkgda62lTUZ38XVtm
	bcK88FxRV45+Z3NFj2+A+CClZ+1JCv5RQ5OvMoikKP5Q==
X-Received: by 2002:a17:90b:3a45:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b41c8528f4mr16808976a91.7.1795600945743;
        Wed, 25 Nov 2026 02:02:25 -0800 (PST)
X-Received: by 2002:a17:90b:3a45:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b41c8528f4mr16808929a91.7.1795600945173;
        Wed, 25 Nov 2026 02:02:25 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm29610915a91.16.2026.11.25.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:02:24 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Enable WCN7850 on Maili MTP
Date: Wed, 25 Nov 2026 18:02:08 +0800
Message-Id: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGyBmsC/z2P3W7DIAyFXyXielT8NEB7tfeYemGoWZha0gLJO
 lV590HS7cbSsY+/Yz9JxhQwk2P3JAnnkMMYqxBvHXEDxE+k4Vw1EUwozoSk3xeI1BbaCw+orJP
 GA6nuW0IfHivp47TpPNkvdKWtN4eFjNQmiG5orT9QNSa8ZxrxUegaw7l+EetgqieVDbsR3Hi9h
 nLstPPW64NTyimJhmmEfS/AetbvFSqvzspICYq0a4aQy5h+1jdnvsJeUeb/o5lTRrmxllvWH4D
 r9zHn3X2CS4vc1UJOy7L8AijiovIzAQAA
X-Change-ID: 20261023-wlan-bt-52fae6bc38fa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795600941; l=882;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=3JagGLN2zo0qxqcvn+w/8I3OJ+4hUMFx7TN6MDAE6dQ=;
 b=JSJLKaSZBmKyT4F6H7Z9cl9bn4zoI/AUHyPS5Oo5LuxPyEfEkLfTRxDOg9M/JITLsZkXHqIek
 gYQyqy7RlppCJm/XcTGzcEvak5mCBy8ez7dSDABO5kFXgopW3fEnIG8
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b232 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=hXh6KkJ9KS8hL0CtB4cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: P8XbbLAHxyyWMCOskSEqnL7OjC3pvOaz
X-Proofpoint-ORIG-GUID: P8XbbLAHxyyWMCOskSEqnL7OjC3pvOaz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX2S3y9nVGX8iW
 GEiM5BS9niN1pHnYQ0omtice02mnnB9jLDbiPlK1PgbtXAq/T6rNPftBzX11f3MNeuA6sxbKA/c
 40cmIVPYwjsV2GTVV1wHJqox/UbbSCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX/kKUTpK/X7zm
 Je/B5bJD9sGOtbZghYF4eBBGdAr2K0QrL2o1FZddnFgGQNsxaxLRkubmC9fqB+RftYv7OkL+sB8
 GgD/nr0jOfwVy0Gpgtc+jhSvgeTy2c0zPRKATulGBHa7YnfS7ynAuvSNF/bH5B7vNdVnFWOw8MQ
 meUQjs+VdS3gFvDg2L6t2QR4WbeJioRFYxXjhKzMzL0w6ipeSllYT21MsERL2FJooPXj9/ggiBK
 nNOJOUZF+OBXqLyDkhJ+DJ54EDU7BqTsymsAGiv8CmnmavAJmj0u2u7Gl0uhdrN2r3ViWe1pIle
 p34cIhbfAVQNVKcJNoEvl+TU4uq+dn62pz2EgLdwQpiMVdOsr99vH1bFQHrbY77/pvX1FMaowln
 nVJTuaIUN1HmrkKhhYOW6NnsN5XVNvMd6mqRRrk7eM74797qDuWVX46FZf27ZxBquw+YGlSnNXW
 JUx4sH2wbvoRvIof5UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

Enable WLAN and Bluetooth support for the WCN7850 on the Maili MTP
reworked with the Hamilton module.

Patch 1 describes the shared PMU and PCIe WLAN function. Patch 2 adds
the Bluetooth enable resources and UART connection.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Reordered DT nodes per review comments.
- Link to v1: https://patch.msgid.link/20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com

---
Yijie Yang (2):
      arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
      arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth support

 arch/arm64/boot/dts/qcom/maili-mtp.dts | 121 +++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261023-wlan-bt-52fae6bc38fa

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

