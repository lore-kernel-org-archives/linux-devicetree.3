Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897303;
	b=CBfoW7HFNXdpWkuH8qITuCU5JgIx1JZRvFmvbdKTn0wZwpzZRWjX9c8KaUgGW1dIW/ID
	 4oehzIUPo4rlbzwgdaoERFnI/vW0KXM8alb3ONn9lJhBKwJ3Oj6h5SFS0sQv3mfLrsyML
	 vW7p/R64nYVs23TelhyuCibdKpfT3XOEBriiaeL8/jBQyLUb3MtHx/YfWH6O4/+LbQphk
	 1EyIhYEr8avDfTfdua5oaJOsCqVf4OpPlrtiyQTCB9mbT3Gur+o7afOeS7XUa8NC54D+v
	 1QAr21Kj14ZZVnpaxi/QD9olsp9dT6s3ZBEsGJYOEcC/Dl+eYCGpPycAkrsWElO881w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
	b=UoEAQlnRk43J8mAkRyY9mbhp68pm1AdAsuzi1iH+fW8BmjQk1d37yBGaIsNGtqppld/z
	 BR3hfkMR9TngloNDx8YbrzLnQTkNrvRiRh69gP8uIlb42fEMmkX6DJ0sf6uN3Rcv0M0Vs
	 a4MCWma9C+SbuIQaUx+P0P04XGb3Z8Y/Vaj77WcrFM4bbbwK0Zo2l8ObMi212QoLxvvxQ
	 IoHI9Xh/tLe0MmdtIKFNafJnlu2Ro6ibe695hA3A/aQvbHUpasIuVqxPQ0OPj49TUODHI
	 u1owwnuhn9DkD+tWI4wV7CMqSHuTCbd+6ym6X/lKqTAfe2DqwQeURns+YzpVq0NJOzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05D606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF05D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aEXk4146663
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=; b=QWbc13VmIdJvnXzA
	bQiATrZcnstmTHHiYR6z7c8SXurnSXQjcNElEVWRw9/7Uqp4h/G+PdHc/tn9gGKi
	KUjKLAxo1ROdxa3AG2rbJobTSiMHXfc5h5Wka5NBVMRC8/O3Vczzr+EBXujAx1so
	srX8GE5AYypBPMwKJSVBjjrOsrjr2WpWTYPlWmwSOWBmlPcqeYvK6Nh3pZMcUhi7
	5pJ3gqRMgt5rKqy+5gYQmvk/j3dBfvjQHiFhU3AljpSjhonuhmcmXdq8tqfoqp/J
	1i8UcjhhwoUkAKgBu2a6pK3lMW2tOhrBigjb5wlnk2not1hmV2X0MFvP+6su3CN6
	Mr+6zQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfm3y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:35:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3095482a91.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897301; x=1795502101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=TYGo9foxs3rekmQKGjGedjGlFZcozrLORoc7LRb8zc/shqcygtGkKCjHaktElA2yjC
         a8sXQ1Va83cGWl26Dzjli6kBVyKakIaZhraIjKslQZGv94ru8aVd8fT5FzEFDKZVT4Ck
         /+AV+sQA0L5MqEOG9iv4yBrl9fJjpNwCxZasbE4/99qZUvSNki3MdG3vGIaNOMp/vM7R
         OUQpgRxDH7a9UFBghwNh4gn2oup6RfpNHRo4LFeSA8rfh0gyrZHEHaSmVMtJ6bIvxhrQ
         QW+dpVKzLukOe8biH7fJ6IwVPFTivqQxCbBSs8xDzl/D881OjKpLR/UPInTR9+JZXZbt
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897301; x=1795502101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=tLSkaaLpEtawjtblJ5Pd6QeOJNcp85yNfxXTOZouzhgpZLh5Faib6sFAztdixJKJuA
         TuQ7yiScDrUBEinEP7H0pBnhrYZsDKyuN9riDgMrFClANIshLE9MsEbgBuGC7m+dJsh2
         jYTzvOuUNuEbEvq3sWhljyKjbqiLYYvA87BRHK/BLVy/KMimW3K4BWcJ7mIYO3p5W26e
         wLAgbcgMwPoCG0j+H5fEuttQ0rz8gT43Eiuy/THq5JMRYnb0YPNV3vJCCIJDHGsqXRcU
         wzfw3i1nIE598sWo4HUpVnxVYD/FOEoowAEqWXTW4VY3XGll4R+JXfsUfYvoSDmqRBfG
         PKnQ==
X-Forwarded-Encrypted: i=1; AL+hErH55EkTpTUUdaZZ+q3hLpbPsfxRoSargWJ/ah88B0h8gzEWOLygIhfNFJmDEiOBlF4ifpHvBMAlrZRQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tg4lu1aQ72erbdDv/p+O1CN0dlRfJI0clXcd1U928nYm5Bo2a
	omfe5jzoZhG3NJ/GNMmCW8gQloFdd9MqZlYvKRrQJ+beBMAYtSTfImLYSzsi+mcU8BaKT0w/Zib
	D1YFWp8ay5G6S+rBLfXQc5Z3cABtonyQ179KvKAsLjc1JtACtzWFwhaLuEYJddWkl
X-Gm-Gg: AZFdTZezdXXTkliXpuZooHE/8cMlbm9Bou6KRks8r3P/R+y+mkXwEJQ1LLHIKX88IKO
	15beh4QoXvTt7nQOjUvDi+7Wlrm/PW9GPuinLIosAfE9f9NaeL5sz1pvb47vESupgLDZ9qvt3OH
	1S8AKuUNTf3SDc2q57zW56O56nG5xBPoT3Vbd/k+Rccc7LW6RuAan0jfvnDjftc0/jzhtUetrns
	ZCff5KMyJ3jYJrsjouI/231IG2MAjqf66v0iSvh4YUK6446ISKYGQjfxWs6yshDGh+R10/5HeK2
	QnjpmZq2nUt2y/4n2jKRCRgqjgpu8HmuuzEvvjgkyJMxDkfmboa27kT1HydyH0JbclpoFrcnMP8
	7ZTMk4Ier5KI4UZwie3tVEVVU3ZV/KG/hBndkCu2wulr6leSTQ0X62hni8SE7mszv2j52KMIjSa
	Fy0XPAZhZWs7styxn6WgIwgaewqsqrWQbVBYKKbTmmghDTjZM7
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270197a91.28.1794897300554;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270183a91.28.1794897300084;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:59 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:33 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
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
Message-Id: <20261117-add_iris_for_eliza-v3-4-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=835;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
 b=T1+ZDyLe22DDEQKX6BrZVf5duTn/QGSsXWEgvXINf9qJYvlUSBetNpCRe9y7/u1BNyumlFgI8
 6ZxZLWhbyNHBvQMum2SiJuTsqGLezkZy5XyZHA5TU7A4+lVzDbiM+6N
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afbf595 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX7cysYcpjSEya
 v0Vd+/C0wyAxgldVQDCAZSCh6hy8ETGx+VLcoiU1DA1xDD0LBseEnGRlopfP5dvwKhBYSWHDQiT
 hvm3IQP/5IxNl4qyj3z3ItsGKSCRic8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX9EnJB235lYCY
 Ej4IxVtCHfnSPdVYNBRnfVAoA07Aq6Lh9O1up+2h5HYAWu+ISLY3ClCKwe3pTacrkDv6bMibJFm
 q9E9eDofClN2nOWCgpr12rPiTEsjTJYG87hIuyu7Y29OGaRsh+XjqIYHEzWQvycYjM8TM+r+Pu5
 IZ3lmX88K6Tm0NfC1yhaJtYyM0o7CMmzuBV2srlN1Kq3LqXpK/9aARrje5eTP+q7NwsaEo/C1qs
 +007t4B71MZRsqbSv16G2hyXyzUSXrg7ADkYJ3BBomkLe0afVgATxPiXCw0XxSC679u1uqew9jT
 xGmX5rMT+xFhAKUMbC3NPdHmFeZ0WvkrAkQKzbnn5VBXmF5kuw3D5LnZ5Fktpr9MQf+w1dkE415
 uLow8q3Aaur/tdhKwrMReWiehzI1Vb+9v0pU4ch51g5/ppV/+4hPPMSBd6/CzIQHKqHnI7Eh8jh
 xcuo0mTfo4kBEZi1/pg==
X-Proofpoint-ORIG-GUID: oUSLGdAOddno_uMyeSegcdwMe2g5TgQp
X-Proofpoint-GUID: oUSLGdAOddno_uMyeSegcdwMe2g5TgQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0

