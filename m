Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA4735F16F
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110529; cv=none; b=ai0CejViVhyWyH9eV9wV8CW62aSUdp2g+E4kVVKcV/BpfSEVq6D0aE5neCsivu4QaNfzknL/m2uuhIujX7QAbOvMcmtFzGlyNFcm0VLzXcTyUNVZTQD3ZRJSKCvVsD9lH4Ul2Fkl0OAU6+JFadK0sm8hl4J0hdFF0gl9hkAfzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110529; c=relaxed/simple;
	bh=NiMErQwfgmQozkXEiQP6zrM8CRGbezCw8bBHkO4XflQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fALh1nfPdWf2+VzfThINDDIOVlyWmGqmWeT5JXvGGtAZI0nS+i/G0K6IHTArETYWIvKswdDEbV6ElyKiWX1cl8ebVnmMXulrd4iSjHz9ow070n/bc7YfJ6iNIAUoqU9h4fZxdHkwr2gNUTntrRsltg3esvO/KsriCZ05FztHLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2bNQ0ff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyUdm7WF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2bNQ0ff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YyUdm7WF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BYKb4183500
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51Z2lrH+aOB8x1t/xwBkcbadFe2AGDTxRJycg5CNscw=; b=D2bNQ0ffOfzBOQON
	GtxJyUbvxCfPRdzQgDp7o8+Z2VTO3LnX58hvjz0F++unODwDSlRbWIqjLdKJTQK6
	WHM/eC7vbLn0XCdrSqETup2MepiTFqBHpatkiyVYGqUaM3P7u0HCGwtqcOgO/qsK
	WckDXeQwpisf0FOSGoiaVDGJWbakhoTX97odUYXnmdeM+nnLIyr+eEm8Fy6SkMPu
	j36suDnvqWxizwWmazEEov0a4ug9UyDRc0mksnS5zGagf4fN9xIdtZoJJMUwLyp6
	PwWmAnna+TKbvnEqZ71gNFhs7sxhP9iPuuv7BWFxxmhFfoWYvx+HU1hqJWhrJM3i
	j0Q5lQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h5635-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:42:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137eced000dso239762c88.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110526; x=1782715326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51Z2lrH+aOB8x1t/xwBkcbadFe2AGDTxRJycg5CNscw=;
        b=YyUdm7WFRzVdc7i2u1EAKnKemBMgF91yWyyZ/qyLptuWlk9IHTWJfXa21n1p6f0KCY
         0mbJ/sXuNcUojturbwXTHlYdzzNB07gPozMpT57VW0wmYh6W5YeFTlcPOASnUJ5ecjgJ
         xO7+T49j9JO1Riam238ihdpf3BVcOXBWZbopOEj9crRKGPxEqLggSy1eHTiyGvLnY7QC
         FDJgWdjI4B2tZgOENifUiny2WcgM92w0jHztxxgP61FKNp8ANAWQ7+s5hwUIU2nMPmJh
         LRrA00eNlVNmaeyBP2j2fSCv/T7J9RNZaVTMsgkWTp9usfS6vWzjm56eZDF75ooTtfFl
         WUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110526; x=1782715326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51Z2lrH+aOB8x1t/xwBkcbadFe2AGDTxRJycg5CNscw=;
        b=nXkRsqkSuz1dP4mB4MvsaVpZDg06HbsZ+coFW+dRM8V5BSy7tEPaIxow0l2UDv64E8
         fBXJVACdPTmRjBVlx+bpD+YGengFik4sVoxvytlmGjmdek9NFWpj7eJx3V2Fv063odsN
         jbuOOl+xdvlXmY4kEjZOyei1oIYyLI8YAWRsBC4HcY7SU6JyVUqywl8rZ6iIpLzmNTrB
         jYvaonkqC8R/4BEcBho+X0BIgIj4Yq9wuQ2J4tFWqAXhcEhcGPvHPSNPSDQWRJDdAc2P
         tOOZBqOGzeb/5kgskV+R22RaAwQ5y/tp/gKUtL0irb7olJ4s7dIviVvHPYPOQnfRa8He
         QGZw==
X-Forwarded-Encrypted: i=1; AHgh+RqJ70NQS9/FHH3Ukfa6lcufN6hQvlGCkeU+eLW+IRwGfoK8dqx8G4na02mtMEswh84adHvNc5F58K6G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16IQqz23lnEGJ93xt0vdILAImSDmIhnemgtYGgEreyHl9zhAC
	cnQFw9RgyOxh1NtDEBvgMQggaVeNB0FhrzPjP/DABImL8V9YqZRspAHVfGxRdXUD+GgJgZKcjSR
	1mdsnEZnDDMkSn+CTXySAiqfjvlv8wf1Vm6mZ82d2St+MWYvc9nYbJC2F04vFD13d
X-Gm-Gg: AfdE7cnvm/9SFnTdYihmqtogadL/WvbcyedFp8mx84EO1c3OjCDvE2Kjv2bSrzIdiGs
	GbV9IbFU3T0rK/8ghsLSipzYLDJWpv8cBrVUaHBemt3U5Ur6GocQaXwJ1Ev5tE1wW+j8Uwizxwa
	BagiigMzl8LU/eArxR+zJESUDj2QhuU8qVNfvaCPtmXc0jxgTmz7N1iwmZkcGy2A/LLdbNeKW4Y
	99kugVZ3qkkX3aDH7v3XU3ZPPZZF8rdS2H4P8739Z3gIzeWIB+Mip8dOIVDhv9uAqsfSVxIjV0J
	5PqV/cjogXLTCGYt24l7Mox6GzkHyADzBoub3RC2vrMRoMNpXsJGrf/U25wrnbZykVjck6nsrQ5
	fWp3II3Sr+7/OMACBbFGynxHUX8zFw3Hz4wSRfNKq+utPl/kLzwJSWbjCXvbckQ==
X-Received: by 2002:a05:7301:4885:b0:30c:48e4:972e with SMTP id 5a478bee46e88-30c48e4af84mr258598eec.7.1782110526063;
        Sun, 21 Jun 2026 23:42:06 -0700 (PDT)
X-Received: by 2002:a05:7301:4885:b0:30c:48e4:972e with SMTP id 5a478bee46e88-30c48e4af84mr258580eec.7.1782110525489;
        Sun, 21 Jun 2026 23:42:05 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be95ebfsm9357803eec.31.2026.06.21.23.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:05 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:11:56 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: lemans: Add compatible to the
 PCIe Root Port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-v3-lemans-split-v3-1-d26bb22594e3@oss.qualcomm.com>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
In-Reply-To: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX85z+Erz/F8k9
 EimayLephTiTBm2ZZErMZuhy8yQ3CLrTuZdZ2dVzRp+nE6vWBoIPZdHEhivwulbA4zNGwWasGvB
 0ChLlxqzdUM0Qik9PUxMH0s75drGFJiU0jDvj8mK/wfnXjAiKbojuDOmdnj78362nop1OttPY8X
 RcZo1GDUiRSSouHrY50gPLFQz7RGVS1AqhjGsXhQhMZD49tPxx29ryjlIC4FFhciK8kq+avihto
 18obfNLkkty/HHmUdU0DHK1bokY7HBVAjuopCQ3HkhGxrXfSqpJhPn7nftghPOec+Li90XCob4Q
 54LM2RTzpyH/pQEjbQj4YfbbREwg0YclC+mY7UjB8RphQZV5SaWW12ZKTU1D69j0+VkrRlk+3hJ
 rqavQ2HQF/dLxpnf64qLx36CXNkRc1ht+MtixkYRTlQfj8nUZPJbC2ILcncHUod8S5XHSXJ+m1n
 0+3iNWBADGbw2kRoOfw==
X-Proofpoint-ORIG-GUID: -6rewLUf-HIyNP7DheSn-e9w0lnzB2Sg
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a38d93f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=di_LMzEMqSThqvFnUwkA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX5/VGkuugcrOC
 KwJCod/XcWHkOdVU7mkfMAQ5flHgg0oc7W2l8kKuSIMvlU5IS755csXgSoFffa345qq1QTJH9aG
 AZC0c+d6rE65cj5nXTMP74uznHfIRlY=
X-Proofpoint-GUID: -6rewLUf-HIyNP7DheSn-e9w0lnzB2Sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220063

Add 'compatible = "pciclass,0604"' to the pcieport0 node in lemans.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..9afd6e8ebcdb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2779,6 +2779,7 @@ pcie0: pcie@1c00000 {
 			status = "disabled";
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

