Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C6233F5BC
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312823; cv=none; b=hb0ZF+Ww1CZi+Sz0IwYLBv6DfkLslMQzVFY/FiYF4CpPcjdYKchgSnxlJsISFD0WtBgkKxb95FFEWFXHYWK8VnbV9JE8PT0VWKEAaJMV/jOQ6o6k9xdrSngZbbV3HPo7052cx0sML91QSjHS3Xt1Zd5CA40gUDjdPAcsGCQRWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312823; c=relaxed/simple;
	bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBx5/vquNaKoDDrst8IeopXfp5JVTQ0iDbssddo+WBFnAABzHBBHo7epLJtQlxlJKAfDqXP2ajustNio1oEXYvg73ffWQoEtS8YRO+5cc5kmyxcHBw1W3nSXfA0uZZTvYXYPLF4Ene+G7a4aGKBHySauByhaqeJDzBA7Ff/4NLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXUdYpRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTc14yDV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXUdYpRw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTc14yDV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE065q1251604
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=; b=UXUdYpRwymBhpkca
	0NdA6NdoWFF89CdeqIkpAQywZyfpkF9as8Ev1Vu/t7wmec+YDYbVVYvsgTt7uk9z
	58+Sram/KpKxxPnIUCBe+04SN0yudkAx+9jxQ6CYiP+HG5K6jeJx3A2lhkitPPKX
	VWEHkfdk7Thoo40SQFDalCdDMCrtlTM2h8Co9QynU+6HeIVYlCMxzfM9QW/4h02b
	3qhf+FRCDlxAIiliZ1tG7r0gs6Tfq3p8FU0w+Tu/MhiRtG0ToUmhT8KgjyrhP3lL
	9FXHnd73IFTMKrTyJjpTqPOIdwVLYrkMiVLSfLTqrPWgHyeR8d2FbICFmgTRbHTm
	gsM31Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbgf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:20:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1925201a12.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789312819; x=1789917619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
        b=RTc14yDVaCHcKb8Vx2XqODh9J30JLFXKA9rFhjlbof8mIEjrL8rf5rcsVbBSQfHctI
         AgO/BNG+jqBf4sVAprUjZe3KMVFaMIlN+/bT9hlJIi5mhCtJQ0NrKNSyTfsFEf8A0FT/
         dpW5gKfKZiHE3OlP+JEd7XYJUi9bWjSPM/jO9FZXMSxuGr6GKfcHzM9uSyTjnAmYLtvS
         AnfrtRV+GZcgYMAZ6idcfnf5WacAom/tBuaIBCpuUDlBkMj1HIpPLKspbBWdc8ZRj06s
         9ugX57bTh/vhV4Jzuxdb/BpcF9vRCcmGYJ41mZuR9l/PzbVIjjakdszijdbkSEGQAl9X
         VM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312819; x=1789917619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
        b=mdOQJcI/mEiSh9BTxocYcnACYq85mIrt9JwguDdPIPQ1FdhVXL0BmANNAkg22ZzNM7
         ajCOjIhvhJnG/lLia0sG/CU/cmy/juJFB0AAQSZZIRagYBFZEQjipSAufigqFNfB0c/D
         cRgjZKx03qHYRtSi97o4JYXXKY08lsarm9zirnY3DRk8RfWEU21pC9iqDvx1KwbqZb84
         zXy9aKBKQkXC6327AgdV74zEOozTuAhGJkdOwdt4BnKLuATt+G++Lkt+nTAhnp/AhNkl
         V8RdiX4Cnoflthi5JiCl575WmGBLAaNVv5mKu98sQaKxGO6ZoT1MqGAQxhvGuRAp5i72
         c24Q==
X-Forwarded-Encrypted: i=1; AKwUvByWOwZqWxz/lsF2Xp4L0ELNsKe/Pe8VtTOXRjUzw3GAYe2oF3CUmB4dGcQEoLgOWU6EqYYoAZnL6pnz@vger.kernel.org
X-Gm-Message-State: AFuF++kjRLryLVR30vGhrW7Z8JMcZCuHIvU+NwUCK2iAVl46p4Yd+HLV
	VcsUVVMqsidgEZECQboede0uLTciOlg47pjJMZEvM9KnXls0YGAEoMEFcixw7OasaCDe94JYQVR
	xbzvHoTp9kqk4i/66AkaSbpB8bRWttTSpG71e6aJv6XvceFTl2Lem8men2CBOQ6VU
X-Gm-Gg: AYBFou2BxAdK9c+lxOnTMMy03dRcn9LjTK09ET113hsYTBy0/V5Rn9W5ivdJwHdzsoq
	LwnaOCAX37vwkppKnlq3gflonNnP+0DhX1Zw1KHk10ko3w/Ces60vKWZnnqgn5Jx3rZc88NAUPF
	lVV7ZpklEiXvXARXXxQmORfNII9gzOS1VYSBQ203yd2dg3hgTZDQxtcFeJu8JhrHj5J5QEKbC6x
	/iWPselz3zQqgItp3VLCIL4e7gEO3tfRqpSk/CncgGHlDRLTQ71Un+3PzdTxWBC6MOr5SAxsLtZ
	wQXqFNO1zToIqk8jiYsqOiim9xBW4eg4EfV06YEmBsrIQIXLIITQPLJczFElyUjbj4EZ601SuFH
	6V9eQOBo8w7JcRXlOD2CXB3jb1v2pNA==
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr25613317637.25.1789312818701;
        Sun, 13 Sep 2026 08:20:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr25613246637.25.1789312818313;
        Sun, 13 Sep 2026 08:20:18 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm22243050eec.3.2026.09.13.08.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:20:17 -0700 (PDT)
Message-ID: <93c23619-f5e0-4998-8da4-9742d9e9be9d@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:50:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add SD Card support for Shikra SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8qZ_MNjH6tDfx8HI-yEX_CbWmlXlrRjh
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6bf33 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ygYGJKfEQ+goyyaro2Znww==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UBd3s1dwWAu4bQkakUwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX4X/4YlhPz+M7
 fIs/AQoPya0YwPH+8hyebLH4Gh29C6fxoY5hWsuJEJEwbf9g1YPHOOBQ8f131aZ+d8p/i7kP2r1
 hpCRB6Ww7lh5OvS1f2sRR1LOV91xCg8=
X-Proofpoint-ORIG-GUID: 8qZ_MNjH6tDfx8HI-yEX_CbWmlXlrRjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX7IVYBv7nhK3m
 GthQFUCIItolGn8Lu5ES9/7wS/gHqxfL+kXn7N1iHKchZQu/S+jbhgpBPFD9g6Yqx/GpYhXT/Ca
 tDJ2hS2QYN/fKzmx/xbtXmli1HUlVOhZZI2oQ/1Bqlm+weFa28csRDvRgUxPoC6Em6MvpW5DfQ4
 AUX93jDs/dytV5bZjkYlcHKXtWS+xjwjWc+qpj+5TKON8cVTR1I4HlsHkvS87c+KK+amXcdNv5X
 F4twRmf/JtvwMQFYNY6JqvyF3h3Yod4jcN9wOt81n00eAqkyRnu1wkeJsxFgD3DgELmW4FIyOPb
 XPo9hojDrEJFESFu8P9g3iw8XFOq18B2U8Uz41Ckh7byrCfvmcJNTT1mDR5AqurNZkt7e75Ykte
 jA0EdIuryYvC5zgZbMcuDjJhOPOW3IJgVu5GVy4dxHW/pWH1OAgd9xHkFZGQZzdpLhOrUu1l5fb
 l+Wn/sAFOAHXNTMKpDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130219

On 9/11/2026 3:09 PM, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
