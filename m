Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0659C436BC0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342068; cv=none; b=e5Xbx/PIeFx8XD3VvWJLmNTQ4sFcZwTfhb7RBEk+5wPNSIx0dtEKDqAGXcNnbvswT/zGHz4AkpOBkrlEbGXSu4X1wMPAJoQzz+sCwzfDU7vWkGaaz0PCILg4GIT/QsCT6n1MaWEjRXTueZFqUXgmie0WDWFyeo+3/8n4gefjBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342068; c=relaxed/simple;
	bh=g5qJX4JNhZI0DmdycjroFtWKDRd43g5/AYwv9oxJ7n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pF2PrhqYZkq9kzPO9tcIzMMuJpfb0gO3KsINExaFCDAvbZwsfzSgb6snL/ITbpUvllQ2KYCRdct/htPLLn9TGeQuBj+f8/vAhydueThSdQbOPQdKHhmzpfmlCfHam2xV0PpkVU4Bh0SvnBBVqu8MzvejZhHqDbvUPYEFToLx4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gj3meI7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdXiIOxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gj3meI7C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdXiIOxb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDf4366717
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=; b=gj3meI7CUFmhcY9d
	VMkA39A5BOqrTPZsaEHVCSuV9K8ovqGknxgYPlmWb4ntP6T6r02rpI8Z/ngeHAnE
	gEpmeFyEBwya+qsLLQiILM9Oz6ssZae/Qlg+iUK0PJhnt+DdLgrF8eKqLwBIMCLj
	oiZtKrdFJsywQgPv9N8LyvO/ot1DoARK61f3hRfirxmv1wgOcCR3CnNbyxVmiHWk
	6HrJpwjpp7pkBnG++9HHJmioryZSpyb+zK+lryLiKcYyQp3CD1i6RAcrIdZgZ3Y8
	szZJaQ635plv1551L9tiuAC0EgMqhamKcwwlQIgA+1R0WFRISyjAUbRYTFu+qX/l
	vytjpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urwvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:47:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e9c0c4492so69282485a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342065; x=1783946865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=;
        b=fdXiIOxbfrIyfWWY+xBpi3ztbJ3UNpP0V2ARASTk13+ZbtrsQP8MMHFRgSjXv6Z+1Y
         3N3r90zz1a6Zmvd3fwMyFCNy/iQGVjUW8DDkRrU6CiCo8FA8KA/ZCjgOAdfTt3BfgC4m
         lt8LFQjLm+nn5DitH0BwcUR4SG6L5PVWCBdX+xrEspjX33uo5zqPytbKINYzRG3aOxhp
         io3YHhq/itUDUwuRlXmBQHQal+n17ZJs+LqCH7IqXps1gCKPSaGrWN4U4lGCWNH+Pi5m
         er2VDOxlg+n78Ly75GXKnQbTsge5nSs1TH8kQyZEP4HU4ibvMaaNeQ3xl5A0x/JwYu4A
         p9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342065; x=1783946865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=;
        b=KFjywmqldbtZ/LC/O/RAp+C4YnkQewur9Us4q6pwH3Dp5v8/qITfR8/1iEDALwJTwY
         YhZqehpBhjt1kBL3OJPvN3ExtlvydjFFHyuusTcCuDj599F9df8z6iS98L2td36sAh1h
         Ijz/E+qmaMqvY9VKW7pHRqCBRm/yNzN8ktnlD4fl1MV++WVoT1wgg+qhXIcIyltGA25f
         QpnEnrd4/LZo8vEWjLIBtCJkiBO8FHjLKrjaGuJb6styHYaVpNE7V8++9D75akqiUVsc
         z/tzdA1uhq2n+I0rHWcYH744y1HHC71O2ZXVLcHHc08ZkoLD3JpK1t+mI90fl3QVDGE0
         vGqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmOQ+TgKQWcirclWEGbLgx7S5wgLK9EvsppeqR09pUg3ejRMUi4OzVReYPmyQ4BkgikF47pfiQfdR5@vger.kernel.org
X-Gm-Message-State: AOJu0YzYn+Vm1ZqehkLDXjzT1VeDmDBgpgR77b5dqssNIAC4SJDoIkUy
	JNJbgRznlPOrpqwAe+UDqFSksHJD3Wy7b1XSnyyNkaG/KUXHIYhmGvLmNSwVIwNFL66nXcR+NNJ
	/P5DiB+7HlIcTs/GZTOdRXbycXWKg2RymXbAIEUsJxLO077Qmn0rHiEHh2PzhQ09P
X-Gm-Gg: AfdE7cmF5QHlkVENzijzWS0CcBdWhkLmKBDfeMiwu3RQjVwswfYSUQTqUMaMnFrID0u
	eat2S5tT3BwNoN8Twzy0G7unG+pND6UTlGcLHX276UDaVTBGiXUTms7QDvhAqa76pqcV1vl3Y7u
	5UAm4t0gyzw1/ROJ0KdMIFKJxdb+y+yGWR0UuIhQnmzyIzZuCukjmz7qBBd5yoLozrsd9OLjIji
	vBrTbeEH49amDNMLxOU9GdkCYptizJp4Ha8gXfNTrUhtnqK37Abe+MwvR2xk6+9G+hO/tObKNcp
	yTvgvfPtoFexBD8Unu6vYQrv+ey1CBlkqMqWTNehtunHF+N3bQUn922LveLIdvKTm8BxSSnV/Xi
	o5hN0znJnpEZ7yDvQj7/WnSlQmL/wK0rtaJg=
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr87025991cf.9.1783342064978;
        Mon, 06 Jul 2026 05:47:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr87025641cf.9.1783342064340;
        Mon, 06 Jul 2026 05:47:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbedf4sm4083379a12.29.2026.07.06.05.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:47:43 -0700 (PDT)
Message-ID: <4bf121e6-ff38-4acd-8fe9-11489b54bf55@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:47:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fffgHVxf0yar8m0i1FiNFWg6Pp_8uV0b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX9I+RvA0Skcbk
 lEqz9P3rcOZSbp1cZ99GXc30w7M5XNE3Y4B7iu8262erocUp/pMVdKG1vVlH/Yjzj+Gxkcq40VR
 rFCEs6Gb0rH7QRn6kealRk4aG3xCpXk=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba3f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NBHrBlfBUiTlkn9WGu4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0QtxAKPIgb9u
 HL+fz0uLnKgZ+Dlzv9LK7Q40aq9ktUWLdG4Jorvj4zk6YBorcQa9hQqqmVLhGtgR43v6zEIuUe5
 cvlglsZ7MQPog5YrYA0PKA0ijqsd5jLs02x9pUFW5YtUeURXb8KeYI9iao+0aRHdqtHrfHPwtLw
 nigz7jDPHyHfElzbSghqFkkV2m+hlFjtG8f8GXSII3phzll72kZmQQNa4C0iBEwcZkOXMYCIX5V
 1Zrn31WFXBhq8FcM72JC59TzswVj3IvSs36kTGAGQDeA0ebwvMs8RL9ASJTRYe9PY+/TFPUqc/Q
 Kbl16PKER5ohCgcwJRHaJBA5TZknLzWpxTPjtc0UCYoZBtRlqFU2+9DpggKYmrwk9oi/Z6XBMRp
 90MmYv/r7IPuktI7BBjQL/p/jxKK8JFEbw9u2WGW9FA6xIIMRkIIX5U0pivl5SHx3djcnGKhGTC
 MAW4b8XEqZWCNvGZrAA==
X-Proofpoint-ORIG-GUID: fffgHVxf0yar8m0i1FiNFWg6Pp_8uV0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

On 7/2/26 9:36 AM, Qiang Yu wrote:
> Mahua is based on Glymur but uses a different QREF topology, requiring
> distinct regulator lists and clock descriptors for its PCIe clock
> references.
> 
> Add mahua-specific regulator arrays and clk descriptor table, and use
> match_data to select the correct descriptor table per compatible string at
> probe time.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,
> +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> +	},
> +	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(PCIe4) OK

> +		.name = "tcsr_pcie_2_clkref_en",
> +		.offset = 0x4c,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> +	},
> +	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(PCIe3) OK

> +		.name = "tcsr_pcie_3_clkref_en",
> +		.offset = 0x54,
> +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> +	},
> +	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

[!] (PCIe6) This needs +RPT2 +RX2 -RX1

> +		.name = "tcsr_pcie_4_clkref_en",
> +		.offset = 0x58,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> +	},
> +	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(USB_HS) OK

> +		.name = "tcsr_usb2_1_clkref_en",
> +		.offset = 0x6c,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP0_HS) OK

> +		.name = "tcsr_usb2_2_clkref_en",
> +		.offset = 0x70,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP1_HS) OK

> +		.name = "tcsr_usb2_3_clkref_en",
> +		.offset = 0x74,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

("USB2_2") OK> +		.name = "tcsr_usb2_4_clkref_en",
> +		.offset = 0x88,
> +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> +	},
> +	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP0_SS) OK> +		.name = "tcsr_usb3_0_clkref_en",
> +		.offset = 0x64,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP1_SS) OK

> +		.name = "tcsr_usb3_1_clkref_en",
> +		.offset = 0x68,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

> +		.name = "tcsr_usb4_1_clkref_en",
> +		.offset = 0x44,
> +	},
> +	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

Konrad
