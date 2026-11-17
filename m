Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943158;
	b=ci8O52QPrIxwJxFwU7qzyA/v3QevAVWNsYXn3t1zrMWj7muMU9Ays7vwgnRUlf9VSB7l
	 AsX4DMBc6QAwcfD3bZNYdJXS3VPDzY9DptoA2IX7JFO+QBVPc8kvyCeVReqsczX72ka3d
	 lTI6PuHigpSWv8E3d4W83KeG4S2ZOYC2IXqNDKVKhk7hrZ5UGVSKfedKnyEJ9fDBcEVQK
	 +oAIf3aswFef2VGb2+CdymtGQWTWwvPIjjGwVmxFtvmLViSI/4OQCFkRT8W34aodgxdP+
	 9zEIV7CDuPHXAmmomkfxsbm/9M6poZ2woGnj32ZY9lXRpbCrswEGLzsHexvJdvbqNoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
	b=TZqsz8D5JQkfuuGZMcKdPoysEI19hFN8GmEa2SFtKyBNMnmaEh+2oGGYyM0s3GUiRxVC
	 xlU3Af4JYk1sEP14xwidNwpGuT75iM78XIb/AUo79aInBAm/xAd2jxnF/nJpVW+2VjiAX
	 vX8X01lKfJ+XJXPAaRBIbpoiGeOyKIqIRbHuxsnv9SwhlpFKv5ZUVXseJNTurbDicPRHM
	 v20EfjlW2H0xG4mYWhVYnwJQxtvFopegKUDBrz7kuXNaVn1HU+ZfaKw+lu/7W7mjsn1Mj
	 CS4NHTk1xneh/B3Zs8bo4fmbhM+I2Q/RI/mkNg20C1n0vxVhAsNnXz4pGtdcel/MhGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Huk9xFUe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsOqqWtN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B2606A884
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282B2606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Huk9xFUe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsOqqWtN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6DDE3702606
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=; b=Huk9xFUebDjdY4MV
	AGDgLAl4QGZqbpaQAIkzv/Aq09lqh4+ZpJYv8e8HcYk1Th1Fac5IBPUnqN7wWmyW
	sG2IRmDvbDMjFRKMwDJmdFjjZfGsGcG53OfpOrBD2Mm7m2RMulWatWK6cxMLCydv
	sQMOvtFHAc4vMVAaqtcvKQZO+RDkLgTpJCo64Fridy6UAD6Wbe4acVLp/zqayZt4
	LqsDDEfn5F0gqpUlmXkwTAVw3XJwz09mcsU6jE6apXsB9RYR3jDMZidMbHu75K+V
	jxg3VdhPe3BU+h4HNCuaexnl9J80sQ3YbO/fmBDNKWAed89UKBqMKyDxIQri6Rim
	o3WaPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbart0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:19:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-339628f2bbaso25631eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943156; x=1795547956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
        b=jsOqqWtN9KDle/y4CN+L4sKiUEJTM4rOA7fkV1q6B1Sn3K0XofK+gyo5CPUqVYBRXb
         bSzgWpf712zCbQs1qy1BGnAFwDgAdHoqD3ppjB9uStvSQeB288JHKfDMfGT+2BD1Fg2j
         jWVoL4iNYzDvAxaA3ra11kpX+9MA0WrajWf5TwIAdxiXEPzEm+nRXadGtr5p33qYiH9g
         I4citIMXhXoCf65PeIJGv16VFMJtKMc7EFVMu6clgEjg6h9LtkqTM0xzI86BmMs9UlxU
         BO0CCunWdhtn0buj6WtoY4Aob0ifxlmHVQlcL5/WWMDTr/0lWJAbjpCHGFV6HMpcXEbe
         XV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943156; x=1795547956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
        b=jW2ZBkQizWyKtwKPEuWmQ29FFFtoVzH+RMSfOWD5Xazv5apdSdsKl8/q4hcTq7F6rr
         pj45oaPx+Wm5DX1KYXeYW45l7PXw2DiIIsl0dsOOO9jTPvJ4iExqdDoAHcOBDVF0ZMeT
         tvbyUUeR8ss4V53nasjdGevM5jxxv8PakoGJaTF0m/Tad4mJj+RqF2UNVMhvuAEgmk3Y
         HMsiEieXzPjSA3mRiHMqU34xssw3IMgZBhWUWMy/RvkqL5YXyeevl7PsGlSHvhtrH4YR
         VK5CDYERYjwtgMhjaEnzi7R3ApCNJpWtPRdn9gcQTFRxEe1vBqU3zH7FvvUle9495ATS
         sTMQ==
X-Forwarded-Encrypted: i=1; AL+hErGc/ArK6DqwbX47np1yioJw49S8xlEKc7q4S+P2wgvHkUl4AXSVQZWsmPNgx//IpTiBtu0nI2tONwbu@vger.kernel.org
X-Gm-Message-State: APuU4Z/STQlBs0J1U/990vrvgCTklQACc/xiE1xW224eXXQcF8z4yBmQ
	CLDaVLHfYXTWNB5DvD8ZoCSeXMR+Iiw5qxVWDhgeBsKMVlZmdu4fBHUkjaqlYv1eEdCtLv5dLet
	McBztCwTYGHiZemvsPA402MWc9UkcyZLMPEmU0eC9tV10ozHgqYQSzee4vdXVLUe7
X-Gm-Gg: AZFdTZem1YszjE2W/eTSWBhB/upa6qMqvnCSmqn0i5rDaDv9AJYKwMzli6gLMK/Nxxg
	AqIIkOkKFUmu6nq0vWmEl8iW0Kv5eT2J+Op1LXhkKOHTBc4xFYHhoGYKtMEzLgbNYfcEjcKOaBN
	tdZVB6ufeW+2hJNHi9k5uGraT0p1ale2eePb4bvvOohyNDYNDXjQnUhUneMAv9t9uYuNbWyPsxp
	/JnY7NPeiwteM/O2Bd3oRhuQA97cxTuy4qH0WbONx6UmjK0CGt1Ix8qiQWQJpm5DsfzWenIudo9
	oQbfWrdDYVuT461AKmriAsR9WU/vPfUQgUJJRmxF5Rk0btLeBtfMbCL64gGXYpzLYSLZKopuWvi
	r71E4RZj25ytwIAfxX15NkwXRmanCt3a/+QTW1LNTkCmf+LMw2IPRQjiPGf1WaUiOh3ieDKm8aH
	6YyGf1
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520875eec.0.1794943155886;
        Tue, 17 Nov 2026 11:19:15 -0800 (PST)
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520847eec.0.1794943155328;
        Tue, 17 Nov 2026 11:19:15 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:14 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:23 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: lemans: add RAS error source
 nodes
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
Message-Id: <20261118-aest-devicetree-support-v4-4-936587251e8f@oss.qualcomm.com>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
In-Reply-To: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=2243;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=lj45TGHwbnjuGkDzwGb1X9FEcZNqbixnfjHqygsd4dg=;
 b=7FCcTwHtClMg34SlkE4yxFQGBNZNjZaS4Sr3qAjCKSk3fc3GeAl+WbJHh/ic7SmtjkDigfzLI
 q3URg/Ggd9CALGXtCRj+32tr55RWkyf9o3VIqCaSRyYA4rdC7cA0S6C
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfXyBNwgB6WlOzn
 aeH8UTLKwqgvCdJnmqX4brsbTUv2TSiWjBWudB1FoeoKZ1z+uVktlg7qdRbBCt1ahnSXJMzReje
 EP+jpMEQCqybsp5n4Y8r1pNt2E0mpYBHoI4HNa9akOX032zfA9/qhSsLz9cTmcFp3f+2d1QCIXG
 XhF0KVBT+iUCVkT80gXqbj+wpqPv1YY0aw17L4ChDN1nuGkAJsJFgxnokcarxgysbnttMHGL1kC
 lYljD4+gunY+cyEHG/Gx92/vxOON3uX+R3FBu3nKAmWHfRKYlo2srSPHut+GmZaJE5PhEfj/IPd
 GL9r1jlPCzZ45++mRlF43i39K7Gabz+rz09CM0vlFsDjpOvw1jJdALrk+dn3kg60Oh8KKbOG9Kt
 z6BGD33bcFvAsZseAL3x98sy8UFt7tpkFzJKhXUhj4M/zyPc6GBtWreiFqgqkeYj4iuWk2I/PnH
 90fAkZq/1odIeW6Bk2A==
X-Proofpoint-ORIG-GUID: jffD-FD5bk4zMRSLpa3j9hhdO4IU2YCN
X-Authority-Analysis: v=2.4 cv=Vsy2kO2n c=1 sm=1 tr=0 ts=6afca8b4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mXUMc8l5Aljk2L-ovw4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jffD-FD5bk4zMRSLpa3j9hhdO4IU2YCN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX6kwFNKxHkJEV
 OC7/umLp2I78aZorK4qsBpSJMLnwzS9i9qXgOqOTer2gfHFoRT8utis0OhPzo67guFhm9LVGY6s
 zc8qnITceUt5m0WrGIxer6zZ3GdmNbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076

ARM Reliability, Availability and Serviceability (RAS) enables
processor components(for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Lemans CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..530057faf0a1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,37 @@ clk_virt: interconnect-clk-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_0>, <&l2_1>, <&l2_2>, <&l2_3>,
+				<&l2_4>, <&l2_5>, <&l2_6>, <&l2_7>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster0-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster1-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	mc_virt: interconnect-mc-virt {
 		compatible = "qcom,sa8775p-mc-virt";
 		#interconnect-cells = <2>;

-- 
2.34.1

