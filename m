Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DEA5172DA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897265; cv=none; b=CIAmRVGkZFZhKu9ENuISgkjFEe1mv6l2GkPTw43OpQ9nIcD3vD6aqYGhoLpuskJz8VhncKf9Q5wm8sqm3JeckBzjbP+WBJKaVsgdhiTZVDOTh9lvkfEeChMe2K+yN8njGAu0QJJprem6sKEnc3ZE3oTZDo42VlZO2mz1z+1HPz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897265; c=relaxed/simple;
	bh=08vq62vZAx40BjAf9+sA9gEuAv4BeAsI56bsFH54Ntk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwEvhVb2mZ66/wL7YOY05Wkh9WHELghFZ+9bP64Jpt5o7mZwYX0qi2pIdhspE2voZELuw05amxmufK6UJWSmu8MCa3CIbVgUmqHVb+eM03L+G1ibQI2ie8yL2ptj4TSRXNvVwpdX0z/7y274u5mAG0Qdf5YjTaCI1BodhL2dNEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNuU3hhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHqTNg6m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNuU3hhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHqTNg6m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xwWV790997
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=; b=TNuU3hhZmmJpKghC
	LaSJdcVsc6tE1zauGs6S9+JtYmOHsv6bveY2jwSzgLxjWXVuFTmUtA0CUbjSy87y
	Jk1XlPElx81YQ9J5wh/76N7pEc7KgxUl8sqkFcwPsAXOfnZsBUvi3HGz0WZtDz9P
	PnRWGlalMWofiSkT+i68cKJc8Y0Rt0+LTGETpsNi/a70AlnoQKx7JnoEz7e1lXgv
	RLsaa2Z8F9YNvIQ776gR7Q4ZEF6WstODPykhfV6K8YbdBHrdfYJB/vfqhojaamfA
	jxreU2QKKcnTYdC6besAtR0HMLk04nNwmP7C3LtMlma7nCrrE2nI60SfZr+WufbV
	pqfl5A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjs0r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:14:22 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0a8c1b87dso19339417b3.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897258; x=1792502058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=;
        b=JHqTNg6mzN5XPWyjsIFmDa03SBmwBfqCPsNqGWIp/m8aD17uj8tdwjAakjcBABlkrb
         KPi5IxtXhNMPl+sNeN1ONPkpoVPqm0J0bA149RpnMkkLrIKtMX+aVYqPgh+84JrF2dXH
         oES15zeURmcEvjJkPUKljPN2viUWRGkn0kcbSKAfOyE8VCjGpRBv+K1H/RQZrRHN8t6k
         gaLWpok4wzH5iL8nM8YENQWFZGEPs0O1bUnUfwsTMRm+1x9ukP4JLYc2d1/K1SFmdFec
         tG4gz2w6NTAblgPEJNPF4xwNVemGzJPv2Clipmm6pjNxPscNAXw1wWOLrX4G7gGuGzdL
         +fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897258; x=1792502058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qj1BoFRRBVOp4reK3ccfnPU0x8TqeL+FOUKl7+TOi8w=;
        b=LsR+9ZkeIqyH/rPXevLFdgPOP1mSVlia8XG+GWQPlA9dZNYjRHOSaI0G0hUYkXtSFw
         /zRmRlxV2xO6L9OS2lk8X1UjzUnihtL+jqdtVGX5wcboHSh08H+ZaRAc631QvEi6vikK
         EPQnbPSEX8OQEeSN2RrufT1QdLpeKtHHMrnRtw6lOvn0hilB8mIYIyaRAQE+gFRiBNRU
         I5yPMdi/YIZFeF9DkiUXNVewazONc2RKosT+P8JbBeg3AAQeiS7xfumrNOxhwqswymdk
         oQyvB6gqnLzdVAsld0YI5wjfu2VafjQS/NBIBoJYjqFTS9c08mTCDVPB1dPJdELeMpB4
         DNhw==
X-Forwarded-Encrypted: i=1; AKwUvBwOT34BAskvzNglPrZaA10Mi1oyYCKIuEjCp37FTR9LkAjveGczSqSIpuoeCGnj4U6EUP7ggXr7Yr4f@vger.kernel.org
X-Gm-Message-State: AFq9FYIxaVd+qP4S8LbIAujALOYj1AC3+2gbkJS5c7xvPvvnCAGFocXP
	JccRpTdXSCT+gnpUpjb3AZ5lYiiwC9qsWCSg3jsurQ7HUp6ZYNvuaAlXnQIKiTzl6feNXynrdcI
	hBSyF1doTRlBLUULSa8fDJT1pc9rH+7Uve7PyXwQqOHRgN8UbySwmOkkn7+IqYdQn
X-Gm-Gg: AYBFou1N90+XWqiDLvWwcW9oWydEL450WxRYx5ysAEcWKpJvyV73fM+CUlzBUP4yAMp
	QitOqARYDtthsZ1NqllDVy92b98NUJhdIsIDKWGpt7l3k34W7uwbz67W4vPOoa4akl0W980VhUT
	B8RaXCvBjPWQcQMVRgn/HEAw88Uo+Cp8B+OAUB5Z7VkdlL3AjK6eDbsf/fSAmVhpEVfMi9XfgBS
	vofPA5Umtgl6SS6dIy4aWjYMloRdFZS6rb8UMIkxpTLOPHnyqobui1tBNYzelRH5tBrFmZ9PHaV
	V7XKhqwEm6Sa+eGde1xZK8CO7CWezY0cmPcTZFnlVzaRQ4kCP1YuW6J9SatSJck9aT2y+nVQlyR
	PKb9ORjqr+ARrVOaZSD5MjEwbBwJ2dH3QuqoCcHyKSNU=
X-Received: by 2002:a05:690e:d41:b0:677:dae6:51b0 with SMTP id 956f58d0204a3-67936254ed5mr4046140d50.18.1791897257485;
        Tue, 13 Oct 2026 06:14:17 -0700 (PDT)
X-Received: by 2002:a05:690e:d41:b0:677:dae6:51b0 with SMTP id 956f58d0204a3-67936254ed5mr4046129d50.18.1791897256984;
        Tue, 13 Oct 2026 06:14:16 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ae586sm4715275d50.15.2026.10.13.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:14:16 -0700 (PDT)
Message-ID: <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:44:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX3SMkA7gn2StN
 qoCHa5wqCilRvffMwoJSQ5/7tEGwezq5g2bi7s6KkZX/5SxnbqXFidq8XMOYIGzJZeo0qQ1QWaa
 KAFviND+B3YCoRP7brLNMK7U8TDHyC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX3rnU+J6gsz3f
 0qeDnMkUqCZhr3SYw8fvX2XOAnn4cYNr/U1EDK0n3A9luKVLpbWQAbbPq16rW+rSz4n2wOXXfWk
 RQoXZiA01OQ9FxGNWOaBjYTBkJEmkuU0lGG/BCUfHF5ATH8wKSJLARWvYB0y+o2nKpktZpBUV1V
 xqrzNtRwOqTxgUTqcpkkZNNx12Lv0Dnd7ddYQWY1pYhFrj2whGLlHnrmG3jUPYt1Jq+NUeoNw9u
 qUENAh+xNTPjhdn495ZZpVQqXnEhTzXR0QPur8sLVlpxFyM1cHz5sXF3IqHlVCImtO/ap7NB4gF
 4S7VOxVmdG5kRkFIELsWjNfsafGX2PF71fw5RQF0D1Cf7034i9LjOik/wA23wCn2sSxyps07Ryt
 ZjBqog7k1zvgyHXOWdrASuXBN0MKvH8n0ElWNgVTaysjjJhIRsVWU8qL27YE/yRnkJSd0dE9kgC
 /18qJfSZ6bXtbCSp3/Q==
X-Proofpoint-ORIG-GUID: 39dYZetzatuDbbk7LW3aL2egCWoNvj5n
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace2eaf cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qsMvIBxTQZfwbozelBgA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: 39dYZetzatuDbbk7LW3aL2egCWoNvj5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052


On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
>
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>   .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>   2 files changed, 211 insertions(+), 64 deletions(-)

[...]

> +
> +&qpic_bam {
> +	status = "okay";
> +};

NAND is the only consumer of this BAM. Should we move it to NAND DTS?

