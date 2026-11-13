Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596050;
	b=3dVmZs+JGO66Crso4k2zea9JvxymKzMhzY6oeHfhjBZUIntf3Z38cCyjbL+Czfdq3HHP
	 TNM+en1hWTXmVLbgEJZRxcVVaSiZNs32N+2xh1mU9mqvOzkE6DOGp2Df6URDtHHrZv1bS
	 XyzAG7bbsvCYHEYkeFEbBUhXFXrvAPMGk1an+ZRRDpLKvZvg73vx0sOSjZmmp1zzAilRE
	 rkOjuA129X6cticiu0Tcu1Z5QOU/BFy7lA97lW9slzCBcuFEHqQL9GO2k1YnsKo+GwCDt
	 dh6S3t62oMz213KA/nGVIHVAOzCcjTNHxVZxrXhw3cpABivxMUjWPv4asil+RqG4yRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596050;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
	b=gswsgyI+f2NF8StW1x9LuLBfyf2Mm9HTvNPPmqlqq7dfKX1s5jGNfg5BfCU1kBb41Q1s
	 2zkEGpDI5J7dh51wycFAW5N5lrUX6txxLkGgFGW07YvRmlX5g1BqjWl5pKhX3n9ZLbCIu
	 MGnON2k0/Lv06Hsuk82l5BXylsYgJCpHj3JtV7hw+9doJQ5pS1IvcwUoxtfJlug9IHzJs
	 2uAS/r0A1EQSE7QSqTxLcwrpXOoHe5gGX5fdTnrItsTiUppvNJFirpTmqmrmXVioEVlKK
	 O+1fDHu2uUYYSntdjdmz0E1zE41E2AfFMCsxZeP4pdBeDXQrllFAqrVDEAoUtq6qWvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F4C3p0uT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABAE7xxN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90180606A33D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90180606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F4C3p0uT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABAE7xxN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRV93533429
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJ
	QeJVXqWw=; b=F4C3p0uTcayVoNsjTKTmaLlVTDIWq5+em3PnoebAU5jDnbrofFq
	S36f7AG06UvYBUS8nh6TWKxLxv2n3JzVOfe7E8l6EhAbBbSo3Ds6jW37Lmdvr73W
	LXpfxW3WsTp1uKcxD/eh1J1jZPXhwKVBUI5+G2kw+1P3s+6+Xcay1DWE/SAudZt2
	rXMDKBdh9EebD2IH5Jd8Iy3H1zH9eA7+wJpEq7Uik6dow/eXQI4zKibhYbjIR//2
	1RTWK3wr/co5+1woLUhgplQt4kj1d+QJ8CI5IQbm+U3ywe9cFYTyFLkJV9zdWEJS
	Jse6WhxgFbl1UOH5gJevTA0ipc46NPISVRg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaasdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:54:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d60dcf2aso1206185137.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596047; x=1795200847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
        b=ABAE7xxN3B4K5IjYjR1qkYJ9e3xfrZYTioJlCf4LrCRJZYwlJpPcwsJrjzkMM1tkle
         ZSdIx2co1yD2Auu+9ZZ1Tew3aebvVJ/oSkQIFVteda4BY1kkWx6NS8ryHeY4byhdKoKU
         KyyZlb1sE5l2tYT62zTv1kkEx7YiHNsguVjWq6P0T6aN4IQCyX6ilxidm1lXdlfcFg/r
         CH7P4TDO0WDi99l6mKssIJtFGKpOtUrhbWqbaVpohlDyJikc+Fdd0uGW84ben4K41Qdd
         UNTnfMEi1ARhaL4Innnqx93mjlewnmrwZpRaTyuhcQVf4KeP7FSd4EQuyXEymXPu4/NN
         jLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596047; x=1795200847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
        b=Vuo3KnSfgHcYoZhHwfE7hhpplqc3HJW5g6lNrAj9XDriVygWFgNzTwlE1HxeRiolwD
         fnuSfPNatK2+H9jkdjzk1hQAL1K28gFhTRv6KbHKlrxGReFWjikfMt+OXghjBfFmQhyM
         LL/6B6SwMCvGixqNSBfuqtgCWMKE+Ymv2g4UCo+/EjXvmLGfmeed7YDIPYA+kRIVxVQI
         3yV07sB+JCDV+h8RKy6WcOePgTYITApwr7VHm0ku2tDNvbpgdVRUOIde+RoL/6tbN2JA
         w/toZRPmL28qadFovqETtSyMx06aH2Pj/fuckW1hFbTl/0xiMIJciFIq1BhniwsCw1cO
         YnnQ==
X-Forwarded-Encrypted: i=1; AL+hErH0GIOy5sj4C0sSVETBmtyg9pZEyl7fNX17Oh9AI3EvuDSlNt44TAVl+iHS5smIx4yvllmL4nsuANkF@vger.kernel.org
X-Gm-Message-State: APuU4Z9I/tbcE3XCtCLwupT9Sa23D4tBVyZGP7xUhvJLVcDESfbdIrU3
	YPUB5RVWmcjbBq0A+qsQeHLwhL98Vl7osbrc1xy15QQen32vbXo0ysHCEhjoIAicQB408dgsBbN
	Hv7yyYxFG6WktIluX/RsL+ODAJIMOLbyXaCY8BdWxMT9jdfbRe4YrrRSt7Vgtpvr8
X-Gm-Gg: AYBFou2snvQ810ahZU7Hoc2JKcc+QsxacF+JXLTkuk5BZNkqid/eaoIAA+OWOyTFmCs
	3qQIbPcsIXsUlEJcIW5KzgX4gGF5x6kfQBnJw2/6O1JtAYZvlgrgaqiFlSYhbrNJLBO2ZfelwT7
	ANHWLuCTTpYxKxbIZ8Khqrqjwlg1OHA4/1uDbE5F38ZLAWpdtLMNbllZoSQtYbp+nMK3MOCS8v1
	pq7LKOkZPePPCJ+ALt/onMl/dyDZ5Aqz7fHItHS3qjYwuDYVK2Wv8aAETffD6Dr/+l1N1vS7+AA
	H7pYaqKQGERb4exGmuDVDLb+Acfx9gHW6wfNtPj7h4NgpmPCOBNaA2ddLIveOCcfzuKqpIYTeGJ
	XTWG39Lp8SHWw8QVVt7394FRVhGQdKlu/FUpBPP7I1P3NKmelRU/WHwOvM7nnpQ==
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr1495144137.25.1794596047623;
        Fri, 13 Nov 2026 10:54:07 -0800 (PST)
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr1495126137.25.1794596047168;
        Fri, 13 Nov 2026 10:54:07 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm45640325e9.0.2026.11.13.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@nabladev.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, kernel@dh-electronics.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: st: Correct white-space style in stm32mp2xxx-dhcos
Date: Fri, 13 Nov 2026 19:54:03 +0100
Message-ID: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=789; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8Co3w560jrj0hkoBQfgpSV92w4nLlNZ2yKdgRK4VsXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zLBYTXZN4JwUJB5ATvPeHihZEaceg22dgyQ
 oXMh/poDMyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcywAKCRDBN2bmhouD
 1zwpD/9HHdOVPkCYc/ZkoTHeCwfHgj1qnHMhAOqNoHoABa0ykth/ZzERBSFOXlnfLRB6U/kJSHD
 LTtjX5ypIQnhzs66OAbadpoz2thfGBrCY0c5u/I9C9mPW+06COXIoty5p9K/umkrxAtrcdBXTRZ
 zpMbGdo8tZ2zp6CrjZhk0eAu0Xmf5Pia8sTsc76agOiAHQwSN/gIS5aZXI+QNICnqV6CEGeAl2K
 xQPJZFTIj+uP5y/qy1/b13d5mU23Ay7NeEpmIXAhSrvWvc1i8+MDXqYH6WqxIlgIerCAESWRFAk
 WbvVphDqvgmzkq13kyTUkKE3bIAHCyk/47Y4IvIfX8sFFLXgEs1i73nn9VeXoKplXnJ15xAwhJL
 nk9pdUqF5kLsC/jTRocUq1RMp68RGntnwtfxzMYfQSQEPh7CRSZ/2AKy0IvQgNN0BdmrYJ99ex0
 C2afV9PEtUpTAW9N0sjH6Nckt5PioeYhFFLopQBKZYX09TfVuulPg0/lIfgDHesKDasekbdboWA
 3bK00HEP/kujIl4yNT8vz/yMR/UDSPAPKJ+JYLwkGQ2uvqVf61YnjNI+sEpd7SQctyQet+Y8Om+
 vF/SdkFcG19/gdw8PmgwJPQVBHcGQbiVnlbMwQEewYi9o8y42l/hhNL/kYgK4ylKm5N1QOvpmCd kZNxbeyEtae6kKw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R9-vfnJdkA79LcR777n0bjkckRv4D0CI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX8sKw/esAWMns
 QGYpow6A8uYdU1bj8GVdWRt4iVXxcI/tiD+BYjAPbwiksVPLIiQ3VAhwx9yTI5fCPKiKphL/LKt
 PALAQTieF7QhCTJCfDu+u90rKRH7wj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXw44XVMREAxsb
 NSJhq6lTQkJ97NrMwTZRo52ubMfxA/od3sDl3m5Q5AtATVLYrXjUqdhtvzvB/ecyiMupvv1O50P
 Zk3cgIqXq/WsLtBt04c+U37BfN5Ll43Sh5C4Q+eg040gYRfpHZ4vHFttAEOszIMyDFg8O3zgE+M
 2Ac3DVv9ODyWyjkg931aO++siNyx4DTeIpdCcNQDSAmvTqK+0rocxkt+3yLgZAyjGiMLha3x/rr
 ReGpKO46Tta+9m4TGLnx6poSJk1U5FmVdFeJ7VcJ882FlYAoJr1Sk40D/IeUj6ZyAh9fps//+Wa
 08awn6ajt1AiNCW8NALzBu6xyaUj1XLEBAbAdIpb4Xd2tpDirN9FUQMEJZiftT+6X60qCrFjWh7
 xuuedxDk5xe7J4Y4CAkNnE+Br7rBslPr0lSjG/X3Mmy1VhDsbj7/SPiUDisxmnvG/WA9we5H0wL
 bSYCOlTfzErVyN/3kcQ==
X-Proofpoint-ORIG-GUID: R9-vfnJdkA79LcR777n0bjkckRv4D0CI
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af75cd0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=F1UETNCCN1grUUcvQL0A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea989..5453389c3ef0 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -97,7 +97,7 @@ cm0_cube_data: cm0-cube-data@200C4000 {
 			no-map;
 		};
 
-		ipc_shmem_2: ipc-shmem-2@200C6000{
+		ipc_shmem_2: ipc-shmem-2@200C6000 {
 			compatible = "shared-dma-pool";
 			reg = <0x0 0x200C6000 0x0 0x2000>;
 			no-map;
-- 
2.53.0

