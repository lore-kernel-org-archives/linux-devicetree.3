Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572665;
	b=exL10Q/FbJYyPEe/NGfCdx0iy0CE87rYWOHUuTmYuIs1wgptWxA5IM+VDYa18kV8kGsZ
	 XAhRIYHnUz8X3Cr+Kuo4je5oKvDdnk6bUU/cirOvaMu+USMWthqYW1/2GkWT+LQWU7TjY
	 dxFC84nBXj4E3H0Vq7SjtKrYpB2NbaeoSEGVMrja2GAxEz8xoy70Q+zkIvvagCVWA2XGi
	 zfdwrWiNnCORDTY3kvKwTt0kzcx0DLNkiop0gKCdJgLsGcei/ZpB/6jCJHifiQJcFOdPE
	 RVEt+LdkOP2aQokS/yvhdrkvL+XlmzbPyrtUuiGe4MIWhR791C7i07uMbP0Fp3DYuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
	b=dxuu0uXvWVjKNWcpeOlWxNHSdu1/7R8fWCchHbKcAPB3F0hPUNk6EePh8Jr2PuCl0s19
	 wHe1cHvjelXdnDoHogQzx63KZiQqwUl+VigBHWSC30lhlE3hH4pnI5+E8Wt6bS42T3X37
	 9n8p85fosOWU8gxspbp9utiAVfXAJcj8fBLipTvPeBYiOoQl2FXOvUI43Fvk4tRShlhoM
	 3pfJ5ZxdffD3A8oXZ17NX1KMWMirT4dqNeU4WEZnHVX6OK7bdp+znb7hrVbpISkxf33Bp
	 1YiEdBmx6t818m6kbbzLsFwstZwAGBSB8gOVmFbckDujt3LryYl3k6km/p0eAOlPu4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9G2cHdO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29E60A263F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A29E60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9G2cHdO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcVW058873
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1I5Fpk9OxKRpuP/kBPSyuF
	L2Dpl8V/mFpHvK/1KMpxM=; b=OauCjCfQOozEM3K2Exonmvr3kZRLjOm0YoBNZq
	hxY+6PeQPkkaSy2WiF6Zx7MR/CCoz+o7VWJcuCXinnzDncz8EgJTd3WGiALX5Ebv
	5cb4Jkp2ki59qMi19qzDCs3iidv10CLpbYIDoG6BOx6gA8ZJ8x3ri4Wh3GPi0Dxq
	bkwh4UwwJ9f8lNK6cVQMc64IUnkuaMQKBWEYnvb6nAS503foatQgt67FLDkrpV7U
	bPq+tbTruAiDhaOQKH9uHdZpyFJUK9itzowJdzZiNWPq8aZLuOvX3obi/WjLD2on
	osS82S7pFTuNrsqsx1Y6T9lWBddqOPFIFMuo+z5c6+GJaVsQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwayrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1517841b3a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572663; x=1795177463; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=D9G2cHdOcfacymyevRO4S6AlKUo2uW9kxh2Ypyaz0SYJZn65hFXPQRE5utsLoySexy
         I9qSYDq3G2rVbRjBc9GVODhjYA9tquJKyMuT0tC+MLG3hONjg3Fs1KFGm39I/Z0DG37E
         79K+OAAKhIzI0EzXkrrdiPCZfkK06hhhHdFahV9I6xEaEDnppwJycNUiXbjQg1cVH6Z4
         85NBe2jAxTTZEgHvu8EknHIPa4zCbGSztpqzR55xubovUNlWP4UtFSMEcNcxdbfssIDo
         PJmvMUVHVp2rXAwU439rp8I/ihq5/QxvKxDxOtiHmlUqLjyELxnaTLPoawJoBc9g+TrF
         Sgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572663; x=1795177463;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=ES0x2/UDgNxpi1P88fvNGq/QVO6p5DfONBpyOml4PPwf5NLIOSAN0zQw3We8wfQHYv
         QBtIM7zE6so8iitYqjTpEQxm5ZuaF+r/47F0j5hSFg00e2P8kQvTyEVb94FLiEkCyep2
         kftWWfsaJBRGhckBg+3o2cnIZV1AY1bzzdbW3ea182eCnUTKmWy6wbrCXNJ/ucYRzMLt
         vg12nvg7WhsNJOh0UgAEI7Tv0/Nzv7LOk2PW+GAcUuTW156fpq85cHUQJZ82l0Ky6jHN
         vOav8UJoh9hgWQD6pXTLo0To2KoW/lNkcjbXOZ1dPdpBPP6SkFYEwQ2QJ0HjKP/OrIGE
         0gqA==
X-Forwarded-Encrypted: i=1; AL+hErF0Bwm4VvFEsrK9GfnyLtLJEGkzx+qFKLiHaKOe/REuNeG0VzHSGjaXmns8/uwok7pK2qfFhduybs3X@vger.kernel.org
X-Gm-Message-State: APuU4Z95zLzbn5igs0m96AjOQXf5SK2wqSSd6btiELarUze+Bh1LFmSh
	mUpfGK7dgF+tiXz6HIlP3ZzcKjaQNRv1cdjEJC1Th+AYl1TcORwvczDauVceb1RyR/RQYM/Iwa6
	8CW6t3mTzCJYWSYwgVL0btaxTmUMwT2CLbIPrKPJHuqQ50/oxlC8XfRUeSfOQkmvkjexktxDyp+
	o=
X-Gm-Gg: AYBFou1b1K7jopy8CL9xt4K+ybrddz2c+l0Ig2LgMukd32JfWR+8H+AKtBaPmR717EG
	1halLsRTxygppncaKyw7w76ZgcEbd6AEgPKaIu6utKJUdBITYDkv3NagI0ZbvEhhBK1XgBNyCMj
	MsvwOCgej8CxsrL57EEoM99GVg4Dd62qrMbF9Hqq8G+iyXtkG9Is5DLrOH9xl1e5kiKONh9bzQy
	bqDgm9mF7JVe4xV1VcSnCNRihMkw09dbPBBKjmnLZKm+59WWIUX39KfaAlFOH5PeOMP7JcUNzmY
	261paJCgmCm5N8kwkWDn5mCMm0V2xbJir97vF/gu5SJ+7tI+s5DVo1APNf5AWAtNiduMWys5Pm/
	CGGjTGOiQJOAWpt/V6JXKOXnMDW4c7k4k25+xpYGQoDaaGwpm8ZNrOoq+7dWvLylCHepyJrRtKu
	Q/4K50t5qbrg==
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537419637.7.1794572662439;
        Fri, 13 Nov 2026 04:24:22 -0800 (PST)
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537401637.7.1794572661989;
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] Add binding and fix SoCCP carveout for booting
 Nord devices at EL2
Date: Fri, 13 Nov 2026 17:54:11 +0530
Message-Id: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGsB92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3bz8opT41Nyk1JSUVCAjx0jXwNw41cg02dzIwjJVCaivoCg1LbM
 CbGa0UpCbs1JsbS0Ac0uM2mgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af70177 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7kJTSH_YnVbI9ikjjQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: hCP6GqZh7CRWcnOI5UB-Dd1jlTkYr-sG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX7cOGmcXvHWtc
 HzmTQVKDXeg8rv6LSAttC4JBItIL/g/L7FOfjGDtcMjpXiqCUaGBeWG53rkWjTzFIa7rNXjJEBk
 eVuO/6dC/mnKyqSjjgKJ7ScBiR8ydrL0EcAGnRKartwNuci3h2suf2F3GLsMsvTETWJYrCtUFGG
 tpbvc7aC7QDwpG1LMDC/tIlU+i+lI4LL0eshBXaTEyav/KppKYJXhkl+cGDzMX6DKSgpDqY16aD
 Rydnzka/aQTy1+0vmowdfccacJPqkBS03M0qxMU1dJS4CU9te8IflXdqbca8ECC256IijvffxEU
 1KhbhbsNBAuVGA8IEujw0zOxWVnPdGpbNIhKpM+DucrWNNX+QhIlg8J4CVcHbjvQD21bpepuXaf
 JO611hqHavFuzNVcbELvZKnt8gXreA+GIjX3VBJ3aDAI6g11LOT1k25ixnUnc+eQS447wNO6B7w
 3ddVA216v1bap5HunKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX+aAofYQq3f9k
 wxBh7rZ+kdUb4uOBLoXmddP1YwloN1+g3z93FIQFixCmkH7vZOVU1qaFSGQ2AE7ktcEAf7ZvIKg
 hqyDj9CxGCPGKAy/C9cAt80eeE7Xcuo=
X-Proofpoint-GUID: hCP6GqZh7CRWcnOI5UB-Dd1jlTkYr-sG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

Nord embedded based boards currently boot Linux under a hypervisor 
that manages the IOMMU streams of the remote processor firmware. 
This series fixes the SoCCP binding to allow two iommus entries and 
maps the SoCCP carveout privileged-only to avoid a stage-1 permission 
fault on first instruction fetch.

Dependencies:

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

[PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc support

https://lore.kernel.org/all/20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (1):
      dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Allow 2 IOMMUs for Nord

Bibek Kumar Patro (1):
      remoteproc: qcom_q6v5_pas: map SOCCP carveout privileged-only

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                  | 16 +++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: cb70f5c1654381390efba76b2feba8be2331b83f
change-id: 20261112-nord_embedded_el2-073e25c7289e

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

