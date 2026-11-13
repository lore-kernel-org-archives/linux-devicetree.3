Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541399;
	b=CLJN9NNEGOKkZX92/pMJOyrsMw9SN+z/i+qdHndUwTKB4sDXhLPbfWOQoUd0CsNSL5Km
	 rJrON7OJ72vk0JP00KyKlByax01C86uI50Wd39U1pcq2SiQbiHoWez+wPFDOABJGHGavp
	 s426/6dorcm2tu05O6ZjetMCuPNjKCC66pr6TXGzhrWx7dNoHxYaasl60YXPzXyj9XV41
	 7iNkT27/xr46y4dYlkgAKrTLRe185Gzt5rkzvZzluv+76Dj5coTcTHWEshpIl4W/XeZ3d
	 uflbAGMBwlnxoYMCHrOQMadpG/37PHQ35w1tu64rjhrJkulft3Bu3nW71Oa0/n6lwMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
	b=cFtzlCh8TQx200O0Kwtx2WJgz0DrGIc3rTdnAFvKWqDX9zOpUzp/LS6bf4UzIGJtL09e
	 qYiA4Ao3iPz8DkppAondOwGGYVsuXOEWJXBmWx3DWmjPFom0g7nSDaZ+fyQdC9OIbehrN
	 CaJLShOB8e92n0hs5DoAjNvBVIa+ACHpZZt81CqCREN5X24ZDuwgWe+1ISZbnbmLkDkfj
	 S9piVRt4eLl4qZfSQb+wSeXM133wHF4aoy6NBv5HOCQyeou53e4StXTkORuGNVRfnKbeR
	 2bxlqgLwZ+f9yCSGh2yKnJYRkJW0yCPLk+s7DA/CP1KNwwqRsqPBQK4s4bE/1qjsW9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWZqkKJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Drhx4NFq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED5B606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWZqkKJ3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Drhx4NFq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5012636692
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=; b=nWZqkKJ3CLkwxq5U
	8pRfvFrg5fA2zwANer2P5rrsm3l06Y3TxxWLYN1Mb4uRUq1MiOzWMo69f22sdn46
	jSWX59YUz8lkpEIevAXUe4jDEbILWsXbyobh+WoQDoJle52wJnU3W4b661hZKf13
	Ndrcl/gqiPOKTITBQC0I6G59c/NSGM94yquZRBVfpGetA+y9enkHtCmbnLlWDplu
	lXDT1ua5azMvNW3e0/FuxfUWzD3k/UhWRyZw7rPYQ+WZSXDFLcV6MJ/o3c8lbb96
	sALT6+FXMS/SRffsSWB87UZ85UemyWUoBzjlbRXgxg5OoGY1T5gcoC3jLoATTvnA
	7alIEA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4eyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:43:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea446ea8c9so12048765ad.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794541397; x=1795146197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
        b=Drhx4NFqIehATIow3r+WVNkcgWdgaTjh4ghyCUHiBXMNMdnZ5Zaku7KS1bbCYnS7DD
         XqEX2InMCm2CyhoQFOUf1I18MAl4LalCX+ylilFAnVZQQcM+llLBZq7rUNwPrr3B2I55
         KzoJNPjvYtxGbp3xidRuwnzZZqS8/IykB6L63RjcPKoXURLuocrtVh2xDOTK0GsCm+xh
         ItmqdgoZkfbJ+e7C/EnrS28BVPLJiDUx+HjUiF5kD+SdUMa95FcK3PBqjThmsCvkUNyO
         HcWe0pisoAAxeDQ4CDmGOvvkNd/WReuH0ic1HQKkstNMrCiDySHwVvvq2EH2gd9UtN1T
         OE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541397; x=1795146197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
        b=tyWx1LkC7V0R1hoyz7KcgLLSerN3Pcq0cw/cim1BAoLomojkiHh4xwSMGLCNoKziin
         kzch15yvtdL6NmhZ/adTmwwHDo2rfkb0+oZln73l+LOu67LgaQokDlXVe1x/8iErcFp1
         sUTICCoqE9GqhTT9TrdqloSUjns2OBAR0NRgHEu59QM3uN3kiRQRPrIsUc3wumdtwunG
         t9pxHQOBbYYkHo3QlF+fGHdJVzTJHze2/1/LWHBzN0hTZSYc2ECYL/d/2sof3RKulv92
         t69uNMGruCc5m+UnFN1mIwpkg8/bDk6TFf2Z3znk4iZThVnlKSsyQSaMJg3STYYf8O2M
         mjxQ==
X-Forwarded-Encrypted: i=1; AL+hErEHJJUxkWOdQakxGFjAAAmQZrHbXrpxpT2Nd931nOxLv2nhMyV5DWop+Ptkt3YbQVSWkhFPvU6p8ElL@vger.kernel.org
X-Gm-Message-State: APuU4Z8u6mxb2mvAPMeEHEm+Paf3Ouvx4t5jtAw9iht3Cb59NJ+OHHeR
	PlGJfMJHzW1RqGZy+ELd9FOcwNMJJEnNXlG3EYgHXNKX1EW8YCIUOcuzfuLdlrNOvP8XXlLMXxB
	tlPaGRBE+a8z1XUpMmBbr9d/HifuhAvAoaXKCAmvXaBnAQcO6XOdHgnmQhJ4d9Yy8oZSR+AX6hy
	g=
X-Gm-Gg: AYBFou1LABPyA3YI3At5qUYKF99HHgI5tc7zl1tonrDnWMfj4wAoXIcwz8tJjhk7Dw3
	cr5fsyLNS763eWEoFHmWBWibwuP48isJjjOFxHUaOocsP0gdMtPOJVYgR02wVpU5M/GCn0JOE6J
	crj2yu2AJ0j6W6UppITmtEBh7qY8QfzZFIlbdjB2k0Mcr8XekDMEn+gNus7e6MFcp/WZYFB8Xo4
	wi/OwFeS91nuY/vcKJDusdFaztB6MNKfTTxw6PEAWM0PcsSQpuUuouDmF6s9kk6gHmr6d5b0GcH
	EIdJJT99PAQP32EgmRLK6ADkfR0X6LgEO00yxrTW5rGM20pTPVlAHGW+OUKUE6EbsloUPLQBwzK
	Ba1R4GntzbvD2EpfIaJlEnTFNkV7KITbXt9sk5m28B40b0YdUL7LKqAueCumMkQoUar0PDA==
X-Received: by 2002:a17:90b:394d:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b1b0b9213emr653710a91.17.1794541396669;
        Thu, 12 Nov 2026 19:43:16 -0800 (PST)
X-Received: by 2002:a17:90b:394d:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b1b0b9213emr653696a91.17.1794541396142;
        Thu, 12 Nov 2026 19:43:16 -0800 (PST)
Received: from [10.235.8.108] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm2309528a91.11.2026.11.12.19.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:43:15 -0800 (PST)
Message-ID: <ec0a8428-b7a9-4b7b-ba0b-bd4a8737153b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:43:11 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
 <sashiko-outbox-210918@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210918@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RrZbclJraC5BaxWvq79QDE1r9SVG3XHh
X-Proofpoint-GUID: RrZbclJraC5BaxWvq79QDE1r9SVG3XHh
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af68755 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f0regg0dAIW5IDvKWx8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfXyPLG6gr+8I8K
 nhChwgw0m4eYWku8J59rHn+pioebCpcXN4L1cJxiqktrEFVNs5SNRbTv3xeZ0OzrilMXIXQBKLJ
 VOXr3tAomRZW4ozaDNPZ590AMHQX8w8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfX7xlbma4ti8UB
 ZXQT7mTOKpi+Id8077Gq22bHRUvNv5RRZK40sRkNd3hJfUI483WaxovRgZBkPKIgVakzc0MUX/E
 7Tw9lIlk5K5/JQHBRJzBknZXdevNO1rKMCSQn/nF20esljF8kqsZ4QGlVR185cP5JLMuYLTHYRL
 BeqTlfStJSEtNN1pSSXi2M8GOgznUVH9wm8NTHxEHEiE9sdPo+3uL4XHb8LqdMEm0FcjRl9t/qY
 NHdj6BOtp3eiBruLaIQPRekTum22aHoQ5HW2Zty0Zt2Ww6Slu6sZWQlJGDhrc6g9YT8S1BYElkm
 Ew1gOfkjMGPAKomThbtXyBcQzGbcccyg/AGOr5mj4oEB/B+lHusnmeZgRfPqyis3UmpTP8J3S0x
 Vao1jz6rEPRCifHzAuVUNcIz5oAf/kthiquhsMkdOT6ajG5nYgTbwSZjlZYhnXjbWaCc68d0GQ0
 6DuRXBGNt9z+9mEP5hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130014



On 11/12/2026 6:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: qcom: ipq5210: xo_board uses xo_clk instead of
>   ref_48mhz_clk
> --
> 
> commit f6342940567706c16d7408b991562c108f13f6b3
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> arm64: dts: qcom: ipq5210: Add NSS clock controller node
> 
> This commit adds the NSS clock controller (nsscc) device tree node to
> ipq5210.dtsi to provide clocks and resets for the networking blocks.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> index 0c1ede0f73b21..11915f8eb1567 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> @@ -331,6 +331,46 @@ frame@b128000 {
>>  				status = "disabled";
>>  			};
>>  		};
>> +
>> +		nsscc: clock-controller@39b00000 {
>> +			compatible = "qcom,ipq5210-nsscc";
>> +			reg = <0x0 0x39b00000 0x0 0x100000>;
>> +			/*
>> +			 * Note: CMN PLL output clock names below are reversed relative
>> +			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
>> +			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
>> +			 * to the PPE hardware block ("ppe").
>> +			 */
>> +			clocks = <&xo_board>,
>> +				 <&cmn_pll IPQ5210_PPE_CLK>,
> 
> [Severity: Medium]
> Should xo_board be parented to <&ref_48mhz_clk> instead of <&xo_clk>?
> 
> arch/arm64/boot/dts/qcom/ipq5210.dtsi:
> 		ref_48mhz_clk: ref-48mhz-clk {
> 			compatible = "fixed-factor-clock";
> 			clocks = <&xo_clk>;
> 			#clock-cells = <0>;
> 		};
>     ...
> 		xo_board: xo-board-clk {
> 			compatible = "fixed-factor-clock";
> 			clocks = <&xo_clk>;
> 			#clock-cells = <0>;
> 		};
> 
> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts notes that xo_clk can be
> 48 MHz, 96 MHz, or 192 MHz, which the WiFi block divides down to the
> 48 MHz ref_48mhz_clk, and that xo_board is a fixed 24 MHz clock routed
> from that 48 MHz WiFi output clock divided by 2.  Because xo_board uses
> <&xo_clk> as its parent instead of <&ref_48mhz_clk> (unlike
> ipq5424.dtsi, ipq5332.dtsi, and ipq9574.dtsi), on boards with a 96 MHz
> or 192 MHz xo_clk, xo_board will resolve to 48 MHz or 96 MHz instead of
> 24 MHz, supplying the wrong XO reference rate to nsscc, gcc, and sdhc.
> 

In hardware, xo_board is the 48 MHz WiFi output clock (ref_48mhz_clk)
divided by 2, not the XO clock directly.

I will add a fix as the first patch of the series. It changes the
xo_board parent to <&ref_48mhz_clk> to match the hardware clock
routing.
