Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB884E13EA
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056170; cv=none; b=NAd5o19NICHhnIR5INe2jr8u2OQX45lkZrf/Wn/PwlIt10yq5n+k/0hj9VSdWebb1VDzk/Bv6xKFwRKuH1bk6GZwPaXFk8K9UPYnjvGAi0LO28cOEiFBxt9P0wOHdF0+K2gA/ZryAuX8TQNeEWTMcSAA/juErWcaC1nAib41CZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056170; c=relaxed/simple;
	bh=hMfKOvmAzlo5fI5dBlL9WCAS+avt+pks4MJuSRxNFeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/EN49mxz12JeqpRXKMrrwFnenMF54jqZmR72Jhy7+ZYNmMkkiMVMzoYbrX2ZwcP0DVSWrKY513kNDZl5aaMc2oquWjdVZKnTQSGYIfdZjjmTu4UziSahVGDM7Y4arS8RTNCFnDNvC5T/MKi5v/LRSuEpXkaovNUu1oBL2xR9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw69Rp+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXGumam5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw69Rp+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXGumam5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8Ibe03468831
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIcabBqKQNdc2sscABVfZLyCZqhIe0PxX/KTiOQKlRE=; b=Hw69Rp+OZti0pWo4
	dAnFhXof4mifnLJz5qFIrgrN0bySW9NiMCthFE/NI/OTvSxmatjP0I8VXddUFaPZ
	9ug/vTHXge8hL++FL66FylhdNj+Y+keelsgmaXESGGxgQrSDUyXUOBSQTW3IPxgv
	bdnStMhLr1AMzbL2NxjiEbdnl1V3/Z8+csG57MZd2kh2ahrj6eUrmll8D6eW3Olb
	kfU1LhCp/Pis5vVQN68G3yKjPIkwUvrZ6WYPrHH2CPxBl9xodYxqAakhUlkm2rwT
	8iRxzJ088aHS4xYVAHDDlChixzmeHvcbQX4kV48HqWvMj6CNIiReVZ8oIfT1/OyP
	QAS9yg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bh51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:22:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc19d8e59so60598685a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792056164; x=1792660964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIcabBqKQNdc2sscABVfZLyCZqhIe0PxX/KTiOQKlRE=;
        b=HXGumam5cI1CeEIGI1V9fV3Yz6eVGwXG1zu0A0s7eSrfMANOTloS1wUXDvbVrBmaYh
         K16Zbbw9n/jRQQrnH45DNvhsa4PAHS9mraOLfAjA0S7OYKDzDdOwGYsfLFW4b3T3zHrE
         qJNpiC9RkwAlD/eaic/Bo5K9P7m1/KG1am99jVVNIHvOJKvvV/pklFzyX4bUuXKvcxUe
         XWfxDt1ZzjZ1iMqS+JLtkC5yuI0wkxkKYWk/2V+fZhKAgBjfVBF5s/iwvVlv7t1A7iVl
         Et7he/k5Hek/D9H07kpZ/HlfsTaLkse20imIXlgQlUOVF1svDBAgLEqBUIaTWTYhrtIM
         P4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792056164; x=1792660964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIcabBqKQNdc2sscABVfZLyCZqhIe0PxX/KTiOQKlRE=;
        b=aJ9WJ2lC2sp7KoRnpQJJ7FaCz+KyZt9j3OOtp1P0BUua+Ny5u98NogBSuq19IZT7eO
         pe3z/EFZQW8Ch8nTIJ7hSeoXK9Afvlg407YyEGuBvLKmuql8zbrsWcLe/1Y2gWtiMSZK
         o68gyAVJtBSMoy1Y+TZcfxnfHvsCqweIY0fsPvqQ+6wQ8Y7XBCqFB3YWKlMP4JQo7s89
         nHWyUkKNkNzJCMoViYlWWpmu+wbIomlafsxkScPQiv/FxjZwQAGEW1Pq9BdWLGu+I//z
         nnghwDcXrvztt1VgZKeSFCrS+o7GmTQ7rQkbP2neDdP+UqzsoVKPyuPXdxxbXTrhHrge
         4TcA==
X-Forwarded-Encrypted: i=1; AKwUvByKiaSd33g9HBfJgu1Cu9nxS5XFKClUgFqm/7BMInCl2mtXZvqQSexwaALxYviRuhquFZHdzmhQc6y9@vger.kernel.org
X-Gm-Message-State: AFq9FYKA7bQ3k7dTORw2SdrYStm3ErMr7CTygHJOEbClpBYzb/0G1xx+
	aCSS6C8H1BmL0c17u7wUL2w+stHCOcoC4ZoWl1OAtGr59rstE9fhFfuyG/ARamPV99oYaFUOo1m
	SPKiQk+M5ibmKv4Wu/t0y5+dlDmqKzCcerVaqzIxDSGtgN7T8XO/vNStKNPFkKYX5
X-Gm-Gg: AYBFou3Shs8dsy5XTryXuqpm4uD3BVBWEqNX7eFcLQRgFL2r3WOBaP1u9ns48s28uVh
	92wVSRl04byD02oouoHr/lHolJucSUVw+yadQOVjfRZfB4yOlSSuf0hWU4754SZAUmKl2QOnQwe
	MxtUVxeIEE4e/ItN0Ul7UCt21D35gdrJpbfagY40veKMmioGlXzfEEIvNqHlJRe6ou6Up+oH9Id
	8X7Sj0NmDpyyD6hQJygf6EYshaa8ObepnGH4sWUxW9LaK6MC/BlG1T1Qp5ZF8tn8qtJVkVLWTP+
	H4f6aHNyorFsZ6vr+1rXSgB+zg8QPVfScwgSfqzuAtIsHckgHf8L6U4hbhzGYv7uMxt5z8a0/rv
	0Q1avlud9LUsB5Uxu7aE7Ww==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3098127885a.5.1792056164154;
        Thu, 15 Oct 2026 02:22:44 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3098112685a.5.1792056162106;
        Thu, 15 Oct 2026 02:22:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203863511sm2303895a12.20.2026.10.15.02.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:22:41 -0700 (PDT)
Message-ID: <40657da7-b823-403b-a5d1-ae384db7f3a8@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:22:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad09b65 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=n0qhTGZLqvVnVCnvLeoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: d7JYDT0P0cIlZx3VTx119jJZUAQbzvU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNyBTYWx0ZWRfX7moqX4lJ8VdD
 9QwxjddUgiOKxeB8ibj8yjhScQbq8tDcg8MsxbKKGJkQjliyBUhliKyauD8JmvfH/LqdzN1BxQE
 oNQ6cauHOB1I/OGG/sDTIgklnaGv2EmvN/DRud/bgasuUAdPLXLdphVJLo602Ax94DSMEH6cuwt
 n9p/cO0qMjtwFvqz0y7nctHpd/drjiv42qXGFhcnv4oN0VdSlQjf7NiduBNp6am/ZHpEe/xGQXF
 DuBpn5hsuLtuAa3vEdTvP4lYBR8bXoe0s64fQbIe25zZOdYUAYD87MRrEPmZG1XaUCyjAqgxZdp
 ecC8xb7eeAsQH/xH+T57E+vqJSqZYjHgwwUDc8eocb2sAUrnYkAwON4oiGVvuHjl7d3zm4gUP9W
 JYN1jeq08hASYhI7DWZbGxR7uTPiSNNmgf9rbDGS8JZY3lsr+BkxEkTbEmSpSXopi6cH5Iupq5e
 XH01fe8ITdsrSKAy3lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNyBTYWx0ZWRfX92Gk9+MvwBl3
 1q4huBxHYrg4K7VnN8Pr/kpYEt/0jHa/Th2vlYBoJuEUcOKkmah1gh15kuIgVj62JQcCtD2A6xI
 Sj1Bf74keS8VglGYwt+fthESv63IZ04=
X-Proofpoint-ORIG-GUID: d7JYDT0P0cIlZx3VTx119jJZUAQbzvU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150037

On 9/20/26 5:28 AM, Vishnu Santhosh wrote:
> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
> to provide modem data channels on Shikra.
> 
> Reserve a 256 KiB restricted DMA pool and reference it from both the
> BAM-DMUX and BAM DMA nodes. Set qcom,vmid to NAV so the BAM-DMUX driver
> can grant the modem access to the complete pool before requesting the DMA
> channels.

[...]

> +	smsm {
> +		compatible = "qcom,smsm";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		mboxes = <0>, <&apcs_glb 13>;

Why is there a "null" reference?

> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +			#qcom,smem-state-cells = <1>;
> +		};
> +		modem_smsm: modem@1 {
> +			reg = <1>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};

Please retain a newline between each subnode and between the last property
and the first subnode

> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  
> @@ -1866,6 +1891,20 @@ glink-edge {
>  				qcom,remote-pid = <1>;
>  				label = "mpss";
>  			};
> +
> +			bam_dmux: bam-dmux {

Nodes should be sorted within their scope

> +				compatible = "qcom,bam-dmux";
> +				interrupt-parent = <&modem_smsm>;
> +				interrupts = <1 IRQ_TYPE_EDGE_BOTH>,
> +					     <11 IRQ_TYPE_EDGE_BOTH>;

interrupts-extended = <&foo bar baz>

> +				interrupt-names = "pc", "pc-ack";
> +				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
> +				qcom,smem-state-names = "pc", "pc-ack";

1 entry a line, please

[...]

> base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
> prerequisite-message-id: 20260908-shikra-pas-bam-dmux-binding-v4-1-6044889e7e3d@oss.qualcomm.com
> prerequisite-patch-id: c3d19e8dbf9451f9f8155c86c21a4e6b5dc796d0
> prerequisite-message-id: 20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com
> prerequisite-patch-id: 30840b157a197cc896556c0152b26a00abba0010
> prerequisite-message-id: 20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com
> prerequisite-patch-id: a9c2ce26fabf293f94f384409991f8a9b3afaafa
> prerequisite-patch-id: c4d2876bea87e825468eb3bd116bfdf5a203f7c1

This list screams ""can't merge this patch"". Please either send changes
in a series or hold off until the dependencies are met.

Konrad
