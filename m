Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A1C19D074
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316840; cv=none; b=h5UTaolHX6CW+WsEGXnHH0cXzK9Hq31DZ7rFQiU+UBzI1CgWA5eq845GtQHlb43Ye3dOegUeLGx2u1kNLmrFwgGKl/e4qCk9L0fBpHyw9gsZS8Cp81MbiLZnNhRNslZr+T5qkOqt0/3b0wPj4Jiuctyvx/cByHpSex5N7I/2j4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316840; c=relaxed/simple;
	bh=ZVmXjAHHYg1Fsu6M/o6pAJy4zKehtnS+lXfiP4zms08=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AZbf3IJcN3Vv+DZ51DHyCkQ2VDByJC15nB6NszYrQELVPEGoEHCSCMPD5W29UF91y+LnCY7kUeZLdQo/7vyLBlY71aoa2vECfhVE7xxAeDS7eF+Z7si4clS8STbZgYySxA/VSX/5FUWyTYFm0awU6s2XfZlXbRj80vJp3r4qtXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1WQi8qU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtC/UT6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1WQi8qU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtC/UT6F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YptF208828
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4SNNgfuw2E5WG53B9sedu/
	C6rI5KPX3bWFPWlx32I4U=; b=e1WQi8qUBqFsvGmxYPiXxkuQ2LY6TOQv3STVSi
	8JZ1mDFpR1AI46+XzhPPL9h9+rArgOIQjJFbGoNFGa8uXxPLgAcQ7menjGUEhbiH
	1j9/wmCRHRiFKWyQu6O9CQZWAUklEA5asS8spuDuJvXz6qP3alcfK/yH3A5Rm/Ge
	iI7ianphoRUaJRcCj8k0/DiiS8lZg1882gjGo8Lb67jIWrwdJmIYWGIgPkduCAhP
	+3MxO+6FstFUuNA/MucEG1HpjXWqZ2sJL7ZSI1OEH7n6QyFkiuuB3qxyp4V5edDl
	dRyFQHB9PaUM4PwF4Sx3ToGoP4SFJdX6WvVsFvw2JbkpKKIA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898t9p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:13:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341b0999491so548561eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316837; x=1790921637; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4SNNgfuw2E5WG53B9sedu/C6rI5KPX3bWFPWlx32I4U=;
        b=YtC/UT6FoOTaO7hFJOFBe92N9k66KE5gzb4wwWicHXTl0XDAcGalOA2nWuPClOSTXd
         wbdURVOU9ZYFLtoezbg+uFcmQPmdDlDJRAjWDpfRnnjh9I3h3euJa1NDfvL5CYuvpHKT
         u6KOXeZipB9wXTvpt5SywEyLlkGxDwUR/KIxyRZQCfRlZzvfoQYt3lBAyS1MGYMC5du2
         aOaIOQy5PY6yUhgmYy4n6mIK2ivTGHN980r7F8KaBqlOZQJzgCsLWYvn4mwQ+jE+opIB
         G02GQNOjUIVbxOCujET0V/dayPhDZeZbUIcWNjy75YzY+3yzqFBozPiN8qUL0sBhIlJd
         FLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316837; x=1790921637;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4SNNgfuw2E5WG53B9sedu/C6rI5KPX3bWFPWlx32I4U=;
        b=qPi4Ody1tS5exzdxzzzOogxLQNPpEVvmhY+qXBV5biJ3gFM5mTAEWLZ8XMa7k+pX1w
         uXW+nDfZDcgJD1PQ4Yyz3ZB6mXouvdOtsuoudTDYF5g5aR6Br6rVINMzOIglMfR89klU
         NJGioaRZViinC5eZgvpSn3+Hlp7qGcpNkH5AaNrTI0cf5tdCyODXvQrdfyPAcvJ7YiQb
         em22sTEqfCGLvNfHPYs2EL4FWZfyRyBfy1ccJDjCeOqhaoniXJY79K7qPXfX2bB71+jy
         d29fClwCgMug7Gxj289D2uCLyGlmi2A1ZMPba+a+6IoPNZXUZF4P2RgEVZLofZyMPnW3
         JtDA==
X-Forwarded-Encrypted: i=1; AKwUvBxisyPxF/KUZWUdPE+a19guaEMpZTf4dnmt9uatg5ZGbAFLHGQ/bzMvai5Mb3BhuVUcdpoH4TC+w1Ri@vger.kernel.org
X-Gm-Message-State: AFuF++nFoF1liV8zbz5qCHqfRl7EyWiEZgqtoGYFmN8gGncqY3001gMg
	kgyq+SrwfNAOZ66TA76H1lQf1rN0QAtlxk6pdtcnGR74hKHmVN34Z1XExqsHO6CV6/srgCveAH0
	UBc7la9XPh1LSt7WmPhuUw68tUPkmZcpi4jOs48+1Aa6ZkvyzVX9QFs5FvsUZ9o1rgu55wweF
X-Gm-Gg: AYBFou3Va41904Vika+JHR2DnGiUMinrbtlI5q2NsAXPoGzQ4dDp2snytynFiqV1+rr
	0RhvV9KV7jcJl77fw67QAmXtcYlLn8APOc9Tb46EXJsnfQizBWZOnwPBiMh3eKIzYhLITtSlnjo
	drfxBkxreHsdwnctOxKP0ZZ/lgmJ7s8VBmONl8xKvc6G32WqodRX4n5Z717pwcs/HVX2YdGYqwo
	cU+/TeiFTyD811VdjqyAkcAKZilW9x6byyixtAi6CM4wvN68CaCoOuYtKocaHn3MREyAdzS4/4E
	KAVshbCAwWpwjY1pfnK5ltnokZFo9GHpqPnNBeXGwep4GSJoQ/AZV7cNCuhIt05GYHh/qHw5I4j
	vhAjf9TpfTFEHAny6XeWcZ5BWkAws
X-Received: by 2002:a05:7300:6810:b0:33c:4cc:3a32 with SMTP id 5a478bee46e88-3400439d00fmr3810351eec.7.1790316837124;
        Thu, 24 Sep 2026 23:13:57 -0700 (PDT)
X-Received: by 2002:a05:7300:6810:b0:33c:4cc:3a32 with SMTP id 5a478bee46e88-3400439d00fmr3810330eec.7.1790316836435;
        Thu, 24 Sep 2026 23:13:56 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm3381039eec.26.2026.09.24.23.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:13:55 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: [PATCH 0/2] Bluetooth: hci_qca: Add WCN clock enable/disable
 support for Shikra
Date: Fri, 25 Sep 2026 11:43:33 +0530
Message-Id: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA0RtmoC/yXMSw6CMBRG4a2QO/YmpTwibMU4aMsPXCHVtKgkh
 L1bYfgNztkoIggitdlGAR+J8vQJ+SUjNxo/gKVLJq10rRpdsV346zy7eWJ4Y2dw00HV16Iojck
 pda+AXtbjebufjm/7gFv+I9r3HwIpW3V1AAAA
X-Change-ID: 20260925-bt-wcn-clk-enable-9de068334aa1
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790316830; l=1742;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=ZVmXjAHHYg1Fsu6M/o6pAJy4zKehtnS+lXfiP4zms08=;
 b=iJ7//XVwqwM8WNskIai36JigUjVYc6QwdNGgR9ChWGr7/XXwrNx93l7vEANJlBbtrvmS+VrZ7
 NI9ezCaMUsbDhzJsi/+OTbyM7Wv4Yqky2d1Ijp3DxeqircNIjF16Ps0
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX5YHZ+01kq2MQ
 pAOgboNdicVmuivg0Tde5bpEfo/4ldE8qoqIGZrHbG5c5LJ2UKbNeygUj05DTRUqN6hzUvXZYFw
 Te4ofldzAQBpchWGB+AUWj/Z10amZb46gB4JfDOi2xUrE8taOmVVQ9ammjfIx8UNx0GEREdY4Tc
 /98McDu2mapTVwjfPocF8wCwd1KeP5Ly1FaQC7urpU0+2V78HjFYt51Ix14NUc57qJDNz/91dx+
 XN3cEollCmhq/3eBOTWKBB++zc6Jlze4rARxzESqYB57Bp8P7FcIW5E2gB6U+LlXGzNY8k9cSfp
 cUcMcgSHfcCXoE20NOmSLaeaekVXWq26D13PUiGcB1AaR5nMdUaf2yK4wn3LdSzPWwZ+wSkC5zy
 2J/d75RR++lskQcnK/E2LFVcErCpFrUR1GPmNsaDZYr844dMr4SBVmeyXLxssmosSxp2+sj8ZL3
 vzXsnOKn4rHRnRTx6JA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXz5pSGuZtwVvc
 3JNZM3LOZNu6PUkeLwqNfhjCKttxyYTJQS4qCYX8J1afEkEvobAWyfaUhwAoyb09r+j4dZV6ekz
 Y5abGWINpp4/TxzToaY1Bfg27QCF/9A=
X-Proofpoint-GUID: N7fiI1tZpuckIvxkRCR7Mgwqd4RvZr8N
X-Proofpoint-ORIG-GUID: N7fiI1tZpuckIvxkRCR7Mgwqd4RvZr8N
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab61126 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfHAzJP9F53XK3jcxtYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250024

clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
every clock, keeping them non-zero until a consumer takes over. On Shikra,
the BT WCN clock was surviving on these proxy votes. With proxy vote
removal on QCM2290 [1], the sleep vote is no longer held, which means BT
must explicitly vote for its WCN clock during enable and release it during
disable to avoid keeping the clock active in idle.

This series adds WCN clock management to the hci_qca driver for the
pwrseq-based power path and enables it for Shikra boards. Targets that
do not define a clock in DTS are unaffected.

Validations:
- BT enable/disable verified on Shikra CQM, CQS and IQS EVK boards.
- Confirmed WCN clock voted on BT enable and released on BT disable.

As RPMCC proxy votes are being removed for QCM2290 [1], BT can no longer
rely on them to keep the WCN clock active. This series ensures BT
explicitly enables the WCN clock on power-on and disables it on power-off.

[1] https://lore.kernel.org/all/20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com/

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
Yepuri Siddu (2):
      Bluetooth: hci_qca: Add WCN clock management for pwrseq-based power path
      arm64: dts: qcom: shikra: Add WCN clock to Bluetooth node

 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |  2 ++
 drivers/bluetooth/hci_qca.c                  | 23 ++++++++++++++++++++---
 3 files changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-bt-wcn-clk-enable-9de068334aa1

Best regards,
--  
Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

