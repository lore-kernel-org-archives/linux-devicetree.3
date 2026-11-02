Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621879;
	b=I9uHsqEcCpWckAAj07h8gpH7i/KkkPLbHyQ/A6KZJwa8tPwNToHb6mV1BSTyF8Puqdu9
	 QHmnXT6CwIslkS1e1nulxhBo/FBMcGemMi5XcCjrE3GHxhWk+I3JdquP5CRoCmiMxjuIK
	 1uaQUEwRXLWhFCP4PEjOArY+nvpVv7cBFz0odog7F80EZuQG9sN7Jh+m5FxTr4WKm8Vs3
	 w3DUFALLKYvQ8KmY23QXIfI+5Yj1+srkuck8TgWoegGEAUIDn9ygZmgjk536oQcpE1tBr
	 aY9iEfip548qC9EOMmzhlsac5DGDUoTP+eQVkCZK1p/4v+71G0pRQgvQzrc7a4HQl1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
	b=Ag03ozHLUBggKG6upGzUOm+QcX1rm+EQkPCZkjTa2bbM+R38TtithwLetlI6T2OKIx0j
	 VA96fIggEWJn2ICb150QcqvyIbJ8Ey5wht6HtuMt1jB494LR72KI+Eb+cCU6X3CogR4d8
	 j39711KcEBKdB5vvMYVEu4kRdqrM1PaY8xz/cV69fipxAD58GCMPYE8BlEMR1wKoLCdq1
	 HR4/67beO7XUTyD7m2KFOGQWQfyfn0TLuja2GiNlemix8QAJsdF62oOWTEE+1DVc97Svu
	 AgeedrrZJe1yKKX/QnNTtNwPZm+4haNkJQoe+OO6/6r5i0w42StLyanOl/cxdp/yndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Lq7Ly5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZwpU0+u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23C606A85B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC23C606A85B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Lq7Ly5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZwpU0+u
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299x5g3402423
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WrbMrv0h6y/iikQNp1GRWO
	4ASKxkJC9TURHwVPkxEk4=; b=U5Lq7Ly5xFxWL+cIljkjN98MuEPW78NYsmnZI3
	/M4LbzRAdAmfrwX39Bqpi7dSRQZHF8EA/aoYH+iJ7LcBZYSih4gNjF4jIWtTrLEk
	ZgVLWK3CN6F+4CePanIodAtSRmu/Vj+BXjzgZAqGrbqK+yyiqGMzrs/6HMuljmKb
	fwyWWpN7Zlo9ojzSabjOmPlRFI3fcTPe56vs4sx2SSIbpMYzWwovy+LxEcLJwd6/
	vV7BT2Cg/sqjuXQLudP1HC1PtoNa4GwxDzUpBQsz3Pq4a/oO2ppfyQcbshbucGV0
	KUJxftfWBFbsfTcQfWe0TG4Jg7nsBCNNYU5Z+VUZ9H9Jou/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe921x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:17:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so525199185a.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621877; x=1794226677; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
        b=KZwpU0+uG7NLMrYJ7o8HkUC8WeqsWOkW7kj9pdvolC0paxnsxI33UFVkldRFGt+li9
         V8ww8HZO/XgZ/u3EaFxjbFsCG2drGyu8CgWp/ylXr0tdzZBpSxB2S+ealRRzsV9Ymyzo
         r7B5hl2xIMVeBcVnvjlq384PwbyNogUbyqpOcsYyikEGOCgkN3h5mp+TVldqyPqV1EKq
         ZKermpMv/eusYZPfhVKPqEU7wVVyU3/BFcgLlT5LQMdI7ZRQDR3V7Dlmzf0odMe8qeAI
         SxEkK6q7p2VR1K7npOw7ZGG4uPL4hTcJrf9bduBZIDZvAIuj69u2RTmczilEZqgYkdMm
         RnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621877; x=1794226677;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
        b=iRlnx5QAMBhGQSxv/YvzSdDtnHu0gHkyzOz2jibp4S0JjAvTmPGtewJ66ohqgfxBbQ
         ZlxEw5rqYh+RDfzdGJhfRYxYq2mqdvAVVZ4qR+6Qq5DqxeYPtMBS2K628ghtIBei4/qM
         BMM8xtzqYLlF8iLuGjyZ2cJS63qVuKM9tJqq9Gwvpwfd09vOOHRxqXJByzEalj1MeAb2
         vy6rzn139W+j3HpwhSDfMFKuP5yUsj4nD23+zFlONJWDLMXTJ1cRjfe/d9dXbU6vsfi/
         oqcdfOD6G1vUycyUGjSr1l7Y3XOfntzyUKimzvxY2nmDg4LSHvYI1XYZI/GsOwU0p3aZ
         ylcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPKxuiUyak4qMPvA4neBlwCkuhGZgJyq9q5/7OeU99Up+zLhxRJXGEuXItFHfIFHeFEXx92HGUCrdq@vger.kernel.org
X-Gm-Message-State: AFq9FYId+sZSDFXdHkmoAKr01KEu3PjiUFYLNTwYzqe24BKZ6EQjfTIO
	LZqmqiTz3dCKZKQOASPTk8HsncylGjdNfb2gNaeEfT1Iea5hcd9oDJWGyrMoArlnBcrEqjZBf/X
	rjkMLVNUuwgiXCy/1+/oqRELawhnbdCR7uoI7C/Xv2e9UFjZvEN69ndGKYIWpJ5af
X-Gm-Gg: AYBFou32atIcdEEy6m8UfqGsrAW2id3s37YeJV+ZfovegRD7qnXJiRR0XfS5OYMMMJi
	39vz274bgnbRXkv0JY4tKnXeotoiWajySmaVgXO2DutwmLsVXcngxLcP4IpyU9wNP9Mqtt0cX5R
	k19JKjhfCcE+YH5tlyKzxa8xpqlKNR1qMbKZ3aMmwhRxmRAahsZylaKUekLq9JrTKsuZteC9z4W
	P5CcBwnZhGJ/NMwqoz1JCtvB1DZo0r99z/ouoT/SNuLPSSuj5HGPeX1CzBSNCuY8V8bXtfnCVOZ
	tT0CMFwfoi8/qy1CXLtHZcTlixnnlgcZlxRW7zciI1e7w47CwZsjHVbRNEMV8yC2ICzumhpxA1v
	9EDBwbmeiXxbmtdpdO8dqZHSyNPx8FT4MbtI5eke9lTMCK56CPx3LoVWbFA==
X-Received: by 2002:a05:620a:a51c:b0:945:b967:475f with SMTP id af79cd13be357-945b967477fmr324820085a.16.1793621876594;
        Mon, 02 Nov 2026 04:17:56 -0800 (PST)
X-Received: by 2002:a05:620a:a51c:b0:945:b967:475f with SMTP id af79cd13be357-945b967477fmr324815685a.16.1793621875938;
        Mon, 02 Nov 2026 04:17:55 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm262583425e9.9.2026.11.02.04.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:17:55 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:17:52 +0200
Subject: [PATCH v5] arm64: dts: qcom: eliza: Add FastRPC support
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
Message-Id: <20261102-dts-qcom-eliza-add-fastrpc-v5-1-27ad8db4a47d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG9/6GoC/43PTU7DMBAF4KtUXjOVfxLXYcU9EIuxPaZGbdPYT
 gRUuTtOQZQFpWwsPevpm5kTy5QiZXa/OrFEU8yxP9TQ3q2Y2+LhmSD6mpnkUvONFOBLhsH1e6B
 dfEdA7yFgLunowHGjDRK6zgVWgWOiEF/P+OPTZ86jfSFXFvGrkWgY69RyqW1jLn16O680ieX3X
 9MnAQKcJdTGG+LCPvQ5r4cRd7W/X9eHLfokL2In9J+irGLXkt/wJgSpzRVRfYuC3xBVFRtSwWo
 lFefXdmx+iDeubhbRK2VU563F9hdxnucP/L/9QOgBAAA=
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6335;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MUaSkQuBi8mCm8TvMJjh5957pvL7KrOsrIXVhFbgVAs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H9x8+/TuHL1Ro9pQ8PZx69E8s6QXwzhH33cS
 jyfOfGm792JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh/cQAKCRAbX0TJAJUV
 VvHyD/4/9AwOUdNjYxXbMDUPI2rA8/gqPYDPUxPPnt4wIJY685BrDJugkqhLAsub/BKtc8UzLVU
 wLQ96uc5Sk6LrRBQ3d6zHAWfMgNgGyRHsMLqyBxInlGrz9+jKUZxtyQoGZH5A41BwGXL1YWSRoQ
 QvP4PHQrcuWWLqM1g+R/V1m+vsINLFeQ9I7+YWit3sQ394OL3Zav8OcfzYMp5xn5hmyllGZq53/
 J1U1ly9ZlCbqIC0vxH9PnVmVT0aSlyT59SWXwfe2TD0u79QY1X/4Gl73GFZvBayQ/5nKjfT2YQ8
 shg7yhp/sU8ntBdtPu3iODTR+9NvZmexXrPPS31OdTGVCRMWUpxNVlU/w8e+CXJRmkuuASZW2i3
 JsXfXaDCaOxRuUaqEgq7PxgQREuuKQ2Zi/fwR/YYinjyqRNuYSor7icjozhM45J2yUCOzutPgXu
 ANPVlQdA8ojZqGs8kReXAoiRtXr8d5kGUhS7RTnO0gU9y3qchmcbdniUnXe1yn/KA6s73aP1APL
 RcqfxaK0LhOXkt6ZJzkwiF9ENeQLfpb+yMQ4TMf7rNPcuccVtN51Z22OsBqyf8hBAEzrMXzqHfP
 bnud+oIfVRYmApMTsqDmd4+BTBaE190+oN4Bb7v/Ve2DDsvWMUhKJtrV0+0rTOGlbqZknMzs8WD
 r2WB+eLPUlAhJ9Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae87f75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=l4Guf6AkNLRG3ev-55kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX2xvWtZo5mw8C
 5kfbpx70qxqWsJ01jqCxCMrHB8yXnctWDjyn9CEDY0XyM617jsqKtnv0RNGyQPsoXZpuKt2jPJg
 eQWDMgGGT926HluTTGtkpkl5OBTQ0C5fpcaM2Vmj5/2VKPY1FWttMl3Gu97r6deSo1mrSSo4yGj
 LCgEwq3G2AvEinmv0kJd8DHv6S8YRyUpZj1kdj+CqjD3dGBFJZQF15ZNhr5K1OIuX+KJs0UhmYZ
 RVeNOx03f3qk0cXf+ShjTsINoO5xLMfsv199xgdh2VHywLUSwbZpkjM2+R2bdT8AaMMMv4TvU/u
 VoeCo9xlcyVhH2h4IcXhMlkpqz0xI0CB1VuPBIUD6VeupknDn0AtgzuhDHeDemxF0RUZxhYdWrE
 uTiMWXRIr5owgwBb5cW9An7H2e+Bctc8FPnbbs7feLMHIIm7P/mGQ/sBULRgZ6xUMAF8zEfjjbO
 siZpSwUGm4j+mclv8Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXwn5SNoiwispS
 4ngZo7uHh1LQUPHyLKu8PT+NqpTfCT+UZUuEK8+TYe4VVIFSdC6ihuIAPhNBQMJm1Z6Nlb+T05I
 W81zuF6B0R+NigNL6i+rbj1xNccXy8s=
X-Proofpoint-ORIG-GUID: xj8-kQznncCgTrw_ntfu5tDi9y0w5jvs
X-Proofpoint-GUID: xj8-kQznncCgTrw_ntfu5tDi9y0w5jvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
the ADSP remote heap memory region needed by the Audio PD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v5:
- Rebase on v7.4-rc1.
- Link to v4: https://patch.msgid.link/20261021-dts-qcom-eliza-add-fastrpc-v4-1-4d33839dbba5@oss.qualcomm.com

Changes in v4:
- Fix the off-by-one in the remote heap alloc-ranges size so that
  0xffffffff is also a valid address (Konrad).
- Link to v3: https://patch.msgid.link/20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com

Changes in v3:
- Rebase onto next-20261015.
- Add the ADSP remote heap memory region (no-map) and VMIDs.
- Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1067 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com

Prepared with help from an LLM-based assistant.
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..93e922de53cb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -615,6 +616,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x180000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x1 0x00000000>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {
@@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4643,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  

Abel

