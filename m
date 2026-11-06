Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956900;
	b=MzZQwMUrMz/dm5hFJrZUVBRsEnWZmaXjYs8ZZ00Xs8iu64Gh9WfFripYy+VizW3WBYoL
	 rWrechC8rk8EiOXE7auJAJdOoD5mlGNHADl7OndxCED2UwRmBo78Begi404inib0rwlpZ
	 HcwEKHPPhBsm3fuutpXtzub3wLb4Qh/ObJc0AmIYu+FUzGwwrfOSXN3uA2u2y6PqXSgoT
	 /EOpVBRsy3XUWGGKzShUzZlOevh5Brd1uVVcadky1CIt4yoxZPtl5NSDn48M0qcfs7OXC
	 /uWvkNWH5UlCVFVwLlV4YEJyx12WV9uQmDubXvEENyfDoHV4+RTrpn89I93ItlYTAUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
	b=SqWiuliS5D/4nCLRtPKqiCa2kmaju+hH/7vY9uPH47rUB10pJMiBn5qtqijiN+znSURC
	 aMwwuGe1/6mZpPhj7QrxL19LABQfQgvBvhJQ0mcUFJR+PIhVtEWS02eXMC19a0gtTdv1e
	 yZ0QtYuv2t9GIHn5jtwBryWf966+9KuCrgdaSKuO5hiE7AT9Bsn7lpFWWlevH1Uz16Xab
	 fgS7UWp0sVjDUxKRdicSMHXdr6jGKXw416b1VhlK66w38Q8cV060K3ZHyerG4mq3ELv7Q
	 l0UfKbBkTYzv17kuh2pbhclTqxE4uuFOsHYDJ9oYSmr8W9K8rsWYRLaWqcbUCtVapdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvR65mQq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PQrjFSYe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12889606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12889606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvR65mQq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PQrjFSYe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9kv2333813
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=; b=bvR65mQqcln0yVQd
	oZRk47zerB1kOC8k1e779bDptbL3O+WP2Ft94Vc23/rOrZ9xfT6iOSksOoWXcxVU
	4AD5PIwgD5lVexJUuWzqAmPkHv0jDaDNy8zVjc8EiXctd/qtWfODL7Ayq9/pKaxg
	Lpx5M7YXFnAl6qaW2DELZ8HSdhXOherNGe36ETtsSqBZoopjl0pS0pe0a5srtFcs
	Zzk8i8UI4GRLaxW3uTaczA7FwpapFkM+wAkXjmXlT11cpcRl6GlSL3Syxyver1PF
	mdKBmMzW1nsOmRgt1MZ7itGej6EV4aJEn9j7JprtE7fVE8ztDI8SF6tYQL2yszZ+
	DHuN2g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a5mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36cec75d8caso646514eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956899; x=1794561699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
        b=PQrjFSYeGXsE0PI+OByUVaPY+nkILvr7VieS2rV04u2jmaJElxI2TuIgobPpuNqCus
         DFhyZNlMBQAsKS+nHjupcNl7Zgf0ZVFTMwtkuW9JSxK1SE+ZYzQw21hrRUuqDbvGNc/u
         8zZzpEIlQTnraANo1rYtRpSHNvoCpsNJq9zSGFj+qtAu3M7o76+dlraeC034fZ36n6XW
         DvbnEmaSa4H7GcJ7ysDP7MqgHCz2rH35t6ogHBjKKkLInFUoFSOhHPM2QAsMdRYdFd8h
         GNXdWSAkXMSa3HWH6eis+l5b/6OYmyqe7jSCN8xmJW/ufsf8pfUMjvzi3SNVWmD4/263
         cePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956899; x=1794561699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
        b=m+4hGtYiCE6x2jwjyOXwykzSOUYsteCvl5T9+mV9q1HqZ9eeQHcQve2FVL57kUGuG+
         xe8NpR1iSMv2+U5ROC6LskWcnwPZpCtcpP1ak41rsKyAZyKLuyHw4bwZKTiHnyE4V4fD
         nYbJkgXfxIjYiqttltVRcvEh2v8oP+WEOh4cGwj0Ct3H5jwPv9NMuXhoqzuvVp0O43mN
         fDzJ4rY71bALYRI2a8ebwRsUUZAWq31TJPhBeA+PPam6BPTLRmFeJuWP3lf1bOwICQk5
         Q7bD8ZLgMLa9/y4eIBXGCk8tVwrUrRfHuhAI3NjUAjTxW6zDVm0OzapnEhDz7Eygr4E5
         7TlQ==
X-Forwarded-Encrypted: i=1; AL+hErHpXgQmWItD3zfI0XYMUkZ1haqHxcwMBu2/Jl5AyCobSO/lDiWMRrmKjla/DdXBUSTqZ/QKv+wgDN9C@vger.kernel.org
X-Gm-Message-State: APuU4Z/i1k1wlpPsX5vAPXeHMrgk7rJw7KZxF0UWgVIxm8atlhWN57lA
	Bt9uhF9NrQX7we664udrpLfjGhmjB9MRtRTAAmix9II/LReidqLdOI5pfoVYG0/sUgrfYZedvbs
	ZCFnZKYP+gj6IL7Yu3F4Tlv4KCJy0GxPjuzCloM7JzTpAr/gyOreZSaKOxoUr8SyeM3cwJAEb
X-Gm-Gg: AYBFou3o1NDT7Z5e2i5iUr/yMfOOK3yH0wuIJGi2FqSiW+clUNVgEu+enp5oSN2fhkc
	xQfZzttFd4zlWDcWz481T37vx3sKVDLaO2oVkAEPSEC4RZST8U0bIStYLak2SCpyAfhgyvc41hB
	vaD/r9PigC9aCl3FTZYm68J8NKJXiH1Tkq6LPvrFTBB1BVKwqeVJcT8MxsOTwQ3wTHPtyPP5RVE
	8KCE2O/V0EtaeP1xJrcZi6cRvK0KOnV9GiRu91CbxMtaasRoN/6k7fTGl1/D1OarLalB5qHMBZ/
	+Km7s0na8U2O1n/f75WVQH1t1jUgRvRfWSTETWmPq1QmReHQC4wqZ+gDv6SGbBaU1eb21sPLJdz
	lm7FCPlQm1U2SPGipe0mIeBFHkyw1HeXvCd2FYKlcrh8ERdUxUvXgG0dgBaJvqDxq7A2ElQLBsz
	tp53I6MECKr3JbDwNuuxxJKYtvoX5SXCioufH6WO674Ph1FwtwaoQ7k9nMwKGnTsXKluEo2NL75
	f2Cuw==
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr7370997eec.6.1793956898807;
        Fri, 06 Nov 2026 01:21:38 -0800 (PST)
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr7370963eec.6.1793956898292;
        Fri, 06 Nov 2026 01:21:38 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:37 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:56 +0530
Subject: [PATCH v8 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
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
Message-Id: <20261106-08-dts-v8-7-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: vy2thdz8TCMiP13Iy9p39tByFHef0HAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX5ua8LeVNCwTg
 aaSmk3Qx45m6q3YtKQV8zJaj5Xxtci2ZB01jKmlTS9LXdyJQ61a4VOCCgpsYt917W+86F2WTwLh
 utH/8m7Q53Tap8Eby7khEvEaGKzT/4eMlzM1D9P0RemqFcQwhzCGpt4QTBFWrLYIDVySTYwyqZ4
 5al3vXt0Z8mMr8iPla9NUFxBYu2kZLg8wE1H3t7sM/PPE9g2ZJ/LTIwKzwz3wwxay/UbbRBn4ON
 BA88xjrtOyAYRZgdZw7PqUr8FKCRjvAYZXPjhAJqeWpipQOS8f2qrl+msGl0fqEAiHNLKDW210u
 B6iwsYTc8J7KgiIX2GGDSTR4/OX2o8CbECBJvAdjBaPQ1mij2cLR4fgXBKUac0D5llILqWLrSv/
 8QLJqvpC8f67kh6agaaRbL8H+1HLcLbfJvBrds8/j7ARc2OJ/ub28LNOs7bqearr/DO5DlzVPxF
 3lzX3K2XSbbMRp3EjIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX9oeXH6f28gfH
 EA9FpmM8UWKPZbimLGn6QLDz8LOw6iJnYUlPfhNkHcZRh1eHpFaO/yPWUiuczAs77U/tD90cFik
 4+43iJnKJQx07pZVE8m07Y8tQIYCu0I=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9c23 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vy2thdz8TCMiP13Iy9p39tByFHef0HAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 705d7ed48713..de3504395c48 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -400,6 +401,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

