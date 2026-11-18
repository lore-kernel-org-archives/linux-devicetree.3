Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987928;
	b=gyGB1Ya7So2SSlihpuIcHy2yclF12TMRIItTfB0chIYQ8rrBC2nGuCdbCqjp1slati24
	 DX5dQjNXsQX4ITmcG98bjgy+lnbqWU0KHj4VdMX8NFIhrCwBixlw//jkNIKUscrew5Ny5
	 4oa4Qs+P8hWC6CNLyqGWJZxvksUcKQ+h5knYiIxtskbrCr+POcUFh2OoXkfm3PZ/xu8cF
	 kuNfXAGEU5XMVqpO0e0AttkHKsgkqQw9xzbm1SsvcXNS2w2pzMpnllD8eo97Pji2L5fRV
	 rZnLun+cAUwFkC3VmhBnazqUT9iUtYc67f/bIpLfkjgKFJq8mKjnuW+PamyCGLRJs8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
	b=xI32aAwSP/Aj0YBsGlzLelzMF3IaldJ1YnV0J7CEVLcTXeeGJ91eVP4Thw88eWVnyNPJ
	 insbQvAUrx49JiNrOiDx/S4Ym9MJWo354up8991Uy4Z89rjXnijhypU5WbxN0/37nsTQv
	 QJfQ1zl9Yhi9cRqyPDckwjcT2yS0w2tXQugDQYkmwx5RcYP+mJcPoKrgwph4XJ/6qggpl
	 00MeObclRcp3FsibNOP86GcrkL3tNfP5BZ5R0A/LIhSj02ihUz/llXGUAtQ6SKpre9KmU
	 tzjL0Rj8++I6Ys1RgK4qrcagjPLYPhFinVNqfcXjkTPqgGOit6D1MoWT1MM8VUuHg7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFxrvPYK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxglUxdU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15227606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15227606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFxrvPYK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxglUxdU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vvu04059959
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=; b=aFxrvPYKjI5Xw+07
	nIsWPl9AsqzVCvWbXVqYx/6ST8QP8zShBeJJ9acWuQh3BfHqtNXT5mK0u8WGtnrS
	cXUBkMDoWZHICymN2ly/bjTkL821sxV+6PcMbkRkRZN1BgbWLgQ11AKVMgW+RyEt
	PyjJZvno5hIX7KaNFJsgBElEBk4JPzfOp5hXeKXmJqA8Iw4+oW/POjeEFU1ud9vF
	7Hc276F6KD3Bn07FJel+msonq5kT2zp3J+fteWeax+Wf6QveO/V9GSGgtOWccVdS
	Wn6bXYWwOcBSm281MYU8PSRGCEYh+GneY7RhA2xldCIl1U3zYG44bSu7xQEDpRbo
	dwKQCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchwcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94607500fb0so110909385a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987926; x=1795592726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
        b=QxglUxdUn5PNgbvEIiew8GWulL4KW5QE/QrsMcGvSUSQ46ShwE0QjtYFZiG5pae+3M
         Qx8hRv1u0hIJgVIWNMT8Hh/JyXL5t0SExK5MEriClAlozQzIfWioSEv9xMlrICmJj+r+
         K0qKf9OoR5RsWahgbAhGaNzVFknF2/epodTBWGCsC/6EYGJmRy9yk7smerxM82DrMP60
         V9Oz0K8FQclDf6pqsOhEodADNjYLqZdvGS1/1iq6MsOa5q5fAyzfXwLaOn6m0UiB01A8
         O9aKm1n1OVuFb7dgGtbAt/9CRByhPiW0HScg40YxCTeT3UuG8CirS0cr5jxEVJbCFP6w
         4O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987926; x=1795592726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
        b=jm4NCVZnZ7ginDjjeBxdIRybBv6r66gQYo5QwRPXu7KH0Ivf1q87WHf73aX3vHEP31
         l8GuqdqLDlbL3KWiIH83f+yOHYfcecS70ZYQNmnXNXfn5/RQ/NwQadmzl9tcz8WdzZG5
         UkrYcn4Pgbp9a4+pYgp2/xMcSCz268yFacFnKvKFUeJrt0RG5q18AlAkA2dczR+Pj36z
         TmhYgAmKZ2dOKF+KW0jUEyC4A3gDR2fP4tZB+w8+MCIBzaXhk29J8Z6SMSyBIGV4O7fv
         wcQBDMRjIjRBxh5UmUJhbXA/ZnDdxDCI6qUUsyjgwYCeOmdSt2Uw/PHgQSj9LTQSs1K0
         6ALg==
X-Forwarded-Encrypted: i=1; AL+hErFCaTd+7TOMHiFhV2OW6uKN3M2P6a8uSG+KVZtBigf/oiDS800R3AUhYJBSQGndE4oOodQp76fImRkK@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Id6bno7G7gh9oGP2/dVfnv2s+sYHqIohaXkqgIx/CCGRY0tE
	356RlUp/V4nM+BlnpyJWK5mTu26NrgdIWna0xYBHC7ary7kk3yU1aZBKUlbyw/WAb4VCN2RtNiO
	mOpte/6Gk7BnCtwYMLEx6R/BJrmtFCbpRsRBShlYFBpn4X33TK1nYGro522h9jmZU
X-Gm-Gg: AYBFou3Ts8+R0JBCCGJBs4F47hLiPyLLg5j7F1lYC3RLprpwLIZEmhhRw95KiK1oTNP
	8FKAFezIzhgu2V06cZWMa5ixTOC8EtvDFBpk+pEnfeWmVjzGVmFl+TbNjxOHZK/sdZz/7YkBz+M
	i1bCDApERJUf5Gv05qgLVdk622FQmY70l9DRR8bYKQ5djqZX0rUgAdeJId/bCusvMeLvNeUQFqH
	gArfnpvHYQZ8PNFoc20TCC1HAOvEH1Z1aeYGLC2zl17QqEsvT6+/XUXSBHUkql2fiwvnqWelctV
	L82e5vfnncO9BlGBurc9THICBPFZ9mHumQPIb37ZFvpbT6cdtZu/9qyskVGs3SpXbvp7ddFqtI2
	Mz7z9PN5IfnCWc1KBg3lJUlK4nnPRLAtDCOzlK4/9kUjB/HMO0xLdVUF8m1ISkgh064B+qaDpSJ
	ihlDP0eFhjTd+iUiO2VCp+xu4c/9EzkcGTIViSm7zn
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr336679785a.40.1794987925912;
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr336675985a.40.1794987925459;
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:06 +0800
Subject: [PATCH 2/4] clk: qcom: camcc-eliza: Declare icc path dependency
 for TITAN_TOP_GDSC
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
Message-Id: <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=1296;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=N47i4mUAgUxwVA8cbwb6AJJ/1VLcu7+A2P0QHeIkC7c=;
 b=lpOId+xT4VeWxoTALhDcRN4ApvIdF5ETHZLAs5kUrt+u1qaKi2x64xSrrOAp07xRWnquikUGs
 FFC5bNsQTGnDMDhvVIeLciCRnrja6daKitVbzcaB1boDcW7s7diO7KR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5796 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=schgL9W0h6o9fvJNLFgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1PbIJkVI41fi_P-saooiSLJaAYpU92It
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX7it+Vcm3XXZH
 0mTI8mKK9z/maLdOrVD3RXBVx2et1/+KohWAxGt6NpZalv86b4OaA4mphY62SEWvu5CipJi/hJh
 1C8dhZTXrzdC5TyMyy/DyvcPgw+0mac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX4nrSH0QrBB0P
 iG+WnjYSjN6lBjPoFomjUhjbz8Q3WPWab4x7Bl3LAoK/CHepX67zPlpaRhPshchlUDALhb2ijYi
 WlYdUs1KvIhfdAMkP3FNzDn/Hd9JiQ8DbnOO7+5J34olOQiOpXNCeiq7lKKlJ6tNPeuYE8hqtem
 /rZPdMnwSc4npxOlttPDH/lq+g4XEmdMNWKcQExVM8enqhNQ1nOR9X6oqdDz6oWWjZYckzoSuXw
 iqIsfypW6lSjEg5XFOtn8+XvdpM2E6kjMBrB6V8DWGbOD3BMK2AsfcKKebk6gKTS9kGa3VJuHAV
 cTCaH/kg1dosbY/5dPv7D/6hiIlrIZfKgpiwt6Qdpt3kbHeW25lAGauJ8Yow+ZbxORRjzDFfeEX
 Y9grPABo6Udxd5tecr4XxLt+HcB+EQtgJv8UgftbbnCg6rvoI3lUU5lbITLKpTLcdb+//yJ0UYN
 njAAyMII0rD6/86x2zA==
X-Proofpoint-ORIG-GUID: 1PbIJkVI41fi_P-saooiSLJaAYpU92It
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
without any client vote while TITAN_TOP is still on, MMNOC attempts a
power collapse while camnoc may still be active (QACTIVE high). The
power collapse then gets stuck, and so does the MMNOC BCM, so any later
bandwidth request through it times out in RPMh:

  Error sending AMC RPMH requests (-110)

Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
voted for as long as the GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-eliza.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-eliza.c b/drivers/clk/qcom/camcc-eliza.c
index 7348f4dde65aeacc27182a926a8c0e5b88eacd74..389fb580985ea8b667ab8cc41c6675c0d9057a42 100644
--- a/drivers/clk/qcom/camcc-eliza.c
+++ b/drivers/clk/qcom/camcc-eliza.c
@@ -27,6 +27,10 @@ enum {
 	DT_AHB_CLK,
 };
 
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -2526,6 +2530,8 @@ static struct gdsc cam_cc_titan_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct gdsc cam_cc_ipe_0_gdsc = {

-- 
2.34.1

