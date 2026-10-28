Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188110;
	b=JQvgOUrW49I/iEnqi5BbOO0eH219nLeGJZQSrVlaHD68F2m6LmmXyAGm4se6H/JCfFrl
	 XpZFu0SjmaU8N8cCTm//6qT22V5A+Q2m2w3CYNgYf/015F8FyfGyapQUpmm3UmuTknLC/
	 9OPlD9BioQ/wX8Ada8PNVf4yuwzapBsjoE1A1a6xQOz+SB5CPHC34tWK+CtTZ6Dqm+MDC
	 kKKb6/T7IygpWRQJFWdL/wtgeGD7moGYPchmY39Mz2e3Ojn0Snh7xVQwkrpUfuWoO5Y7Z
	 irUgB1waG9plHOISizXco62Wf+9i7NT3O5wR7mLfbmhRJ9DCK6gDU4VwPQLPFznNBaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
	b=JdMX5mWSNFX4HTir/qGVsxMII79/FKfglMPtB/iSoTPcDf6F1lbLbX0M+EHuB+1Frhxo
	 /2Z7yKIzFofhd6ZEwYGXqPIP3avNRSsXJDUkbNpYO2Bl77ILpDOJ5+iRdpKzrNz0Uj3tO
	 y7HFrehzXrTWnEwqB8updLVFTb2iPL/FHza83bjmg1RqYI4Uw4gJacyf6ZGDQa+y5NruH
	 eTHRUs5zfTeDDouDt5xWgLeZsSw6OAP/Cwehz8SgPXVzbutTgj05Q/lE1ucEEEvJ/zbkF
	 UyMqm5y8y6/9GlVHylekjb37TKh9aBP5m/PxhWDtBpbMYWKddIRO99uTM3CuhQH6zvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bn6P3afa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F7606A321
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308F7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bn6P3afa
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeA1f1606930
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=; b=BPCNdJwD35hChuwT
	JQOnqjp4G0M2tcP2sveGVgO1bOK0Bi6WszVbz4yjet+bzzstrO+Ga2YJLSteeRj8
	zCm42pWeQz72IU8i+1ECjHGVVZNtf5PwqQyYDJtMfes91o39rKJijOyGDco56M5c
	ogvPLGrZdMsmdhqKBAHevYqq7Jk4f+rjk1ThiBEwpAPPnQcyoCUJGE7t7Afj6m/N
	D4R4C0yWpbs5VzefSQuBsgs2ggSgQKBi5cJctkqN/ZcdugzgaV6IUGLI8Ad61d9u
	x8JtSyATjx5267hYSLyKBKxmrERSXui9G+D2B3OU1FZ9jO3U/BOjx5raAkVnvOHh
	VSY5GQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j0eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e987ec84afso8673365ad.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188108; x=1793792908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=bn6P3afa4ok+thlXjBr+0YaDGdiX9PJmq8LlhwhqIG6MRazwHEdEs/BYAjZTO+xAY/
         fRTEFHmaBPiGW/6ANQDax8A/jGdgWJfHn2xzpa2LPJpBazpmltSnKUnq7qcMeklS7Z7F
         0HL/GghM4Ve5cWBDKdidj50e1dSwNKcC9OtukqWa2uQpaluOAmxu7qaEXRLnht7yZEP6
         rlGIg80aFdpa0SAsRJTIuWF1CSqOffRpUDPMnLwYUZrMLoZkI0zFWuZb//WtJm/4wOhJ
         fbY1/mzCWU21zAyQOWWZ3J0AFjeYxz/+lIHfJEmAW+zDwOvGC71KdHa/NlI0W9LPmIFa
         pSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188108; x=1793792908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=eD3jNlxHRzhMB90zDgN0XHCK2JZEaxKl+tbY4sf8ov/C9omEr4HyVSLOPNo1p7H4zb
         n4Fk4zn4H7xE+UiWWMb3mMVdJvzVvp+xrJ1XfbD1LGAcmR2GnXeHAAHr6NLyY/12Iwtx
         9VDm/MBappkTkWjF2ngdcPSON6JTCNg24DCmhygYzfoJmXBaD2z4EyVFYiI/w6Xv8nMz
         7mo8jbrVTugZt8BhwjrXfT5dIQUffyQF+7JIQSWH2nKxLPHXbTf57E4Z7B/uphYc6nac
         MYk6Mn7ee6Vf1fZOMyUXdC1gGUzMNH8/XmkamrLejAGsWI3583UlRxTxEy4Ekrstq6Qt
         DSbA==
X-Forwarded-Encrypted: i=1; AKwUvBxsOP3vt87ZIO8LOWFZRvePB62d5YqNKrOhFpX36iVd97Dx8XQY2ORhgsgcqifsnwwZ/4htK+gJo1VF@vger.kernel.org
X-Gm-Message-State: AFq9FYLozlxyfPy3M3YAtVhAxbcmavhKDbEZJhuWEOrl9n2k4DjVZlfa
	KtCjIGfpL7AFaUCOnw6pY8QKauWMB/aL5YFHAwW88KCwwesP76eZD26UJmyLkPQvHpv25z2Tzpi
	gBcfxyI0gWpGoPP5sRgyFc/s1bPGKC1NzTjDyUUbZ6YjlOaKP9u/BrZytA7URPycL
X-Gm-Gg: AYBFou2e76fQsEl8LHp+gGVdazBfQ3MGdT3XHAHoriolSFkHB7DheT6tmlG8rxCFFnA
	oQmD13RVGtTXrzIS8z+mRPDk0q5YFmdA46lZ/HGAc/G/wCnK5y7wXgIdH5np8nT7rQfvQcg4knW
	RdPXIIHdEp/OdWVXlQiYyD4q98VNuhnxS+F8Y2VIBgxQhO0yxQ5o8dt2s8ELML8S8SAx7j9aaa3
	AUQmdYfN2Un8DxY9qdgKoZRupnqkd42xn6W7FSqYT4mJOFEPRKU46MqC0q4ekh12/UC8RtLuxy1
	sp0Fw6U5YuytQR2H6Gt+jrTNl64gzam3l/ngQhHReq/5f8V9fBsL60Qg8cQHBmX/4CTW9+QLrzc
	PJGyzVDhDRKGXpLHBqj+W1cUxciBfMHvTTmtjpAQ4kubhNYjAzLhf4vCmVicckWXxYEMG2jtWv3
	X007//BEf6XbJKFpFhvjYk7ea5MMbQ
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19433135ad.5.1793188108029;
        Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19432715ad.5.1793188107526;
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:46 +0800
Subject: [PATCH DNM v4 6/6] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188049; l=2980;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=EIpg2fIGRMBRydrB5ptmJ7TII/dpx+YM1XoZaljDCw4=;
 b=x/J3ue5uV1wMxc65LI2QTgcNRDwtcWB8n7h0nyP0eO1K1PUyDd6XfFsaaNBgUK2zJSIqu8/PW
 qhoFFd1vmHqBIA1YzSyn/HzTI0xkTspyTgNaiZf1+/H9UOE3fkw1nRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX/8oplDdafcoi
 8JbftM3ta9MW64SIr803ilxuCip+AgNlFGhUL/HhNSOotrnrAoA7aQJXbt26FjkgyzuvPDJI8K9
 8btou+IUSI1QCkP5PRi6erTZSZVRTNM=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1e10d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: o-LRfcQ57tdeI4Kx9gmlXX4n-H5uZlTQ
X-Proofpoint-ORIG-GUID: o-LRfcQ57tdeI4Kx9gmlXX4n-H5uZlTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX5+pNBQ5u7PvT
 jtXiaARutLdvOdLohXoROgo4TZIs/g910MtHVyZyTLoBWPoRL2BtV/EnRhWVqErBr01OW2NB5B0
 A6zKv3D05T8yehugtWbPD4636bQU01twdMaoDIXQJox+Sxh0zN+G765Kax+Ie7Bdw+uMr4QQTIr
 nRbDgRWD3yf6Enfczkx/Kvlf9cq/QFrdRD2EIx5fTScXJ/kzpM/2z2FOysM5+N5i+Bc1Sn4k/o5
 bDw16ttgT1gyEInDUEIxt3K8hQSMpqwUxSVqfUe5op3Hutfpvh0OaZ3Ll3k0a+PMbdsftLgeuAN
 8jesKYV4VloNGfnaEMSnEU8p7NPujX8e2u3JfXHr0hCsTAXVFr2xMw1AIyNwBeRmO2sBIbsiqL0
 ojPuEX7NrXxOv421CVyX4qJrwYoSn+iB/hiu5P8xwF2+5vQZBiYVUPL8GgGofyATwtjo+1M4V1z
 Pl6r0+if6E6XVd4aSkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node, using
'ranges' to map the MSC's register region to the physical address space.
The MSC register size is 0x2000: the Kaanapali platform implements the
MPAM registers up to offset 0x1FFF as permitted by the MPAM
specification when MPAMCFG_MBW_PBM is not implemented.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..10aee29a1ba8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -49,12 +49,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -121,12 +115,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -532,6 +520,46 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x19870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x19870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: cache@1a870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1a870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1a870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

