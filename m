Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B0037C91A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422084; cv=none; b=DgPoBokEwq5XjcJaIAPrcQlE8Ux7J/8vEZPEdhH9XwqcSvGOTBw8tzcb5mTptV3Ax/Bt7Iue0s4lvgLpLx/HI+n5X0ni6csPFbR51wniBzJ3cLaB2wgzfx1RYgVd25GN36aQXFDO6iGd+SowhmqD9uIsG60oYHUeFSFYI2G9z0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422084; c=relaxed/simple;
	bh=iB18IptzooZUR/n3KqRc65pMlvfNH60ITGcEGbAT4So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjQtcQrveKx6FmCo6RXmwdRZUwOftEkvObLH0dSfHYl1IPgyA3dyQ/nEsC4GWw2SazuXYtYkwGWVjWAN/avHCMH3V5GnJZIEg2iA+2BPghF7RBG8n8N1APVUYLSt7ivaKkrg/mjLlBUN7vZzgBFmaU9nO6E089/+P54QztLOv+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAskscrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2f4oIUx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAskscrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2f4oIUx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lkxe4023813
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=; b=RAskscrQsCQcVvY4
	dm9EQJRTocP2QJ1QuFuAVLvf35m2BJoNnRJJ4ntBNCxWxMMrfbJ2pLxeZnKO1pk3
	v8BIH8PoUh6QyAnHlusBCCSRxQhNoSoSkdtxcRSv+Q+uQf2ZmRRhqms15LYn19eO
	B8lH+jpaAnXSEjsy1EO2aSI1MJ1x0YdzMC/n70OFjiEj+Yi+PVNZilQU+PhA/9UZ
	EkKxXIfsqtVZTLTbrpMa+FgzgElM05Q7S17GBKMapUPm79fZ3uMhh6QQ+eT3B3Sr
	H9b3LHmj1nZT37fADALhLB2Gx6QgfNIDtGkZaIVIXYUtsYLdg3xlQW5Y9V0BlUfX
	0O3zlQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc310-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:54:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso27782685a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422081; x=1789026881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=J2f4oIUx3x5dG/9d1y4n3m3u5vKdSTfuPTaA+0IaDJgRPg1lJV2EOql1Xlc7TwryiU
         lmagKSK7FKMAAOR7Kq6KGrZXNTvRhVIm5OOdjZSP0Chawg+cA/2mMR4AO5cu+MADVvAt
         JKAoM3s3kM6XCNRMAIltYoCLZv205IuPq+htvqARcWuY56pCjLpHq/WswD6fj3P06qE+
         4MCvwXi1lbG7eHkWsVdUz+LKjAoKezwGlZ8LxNSQeDjfS11+7dTnpNgliHag0yn5e8h2
         XpUW6H8eZ4Awn7Hs8mg5qzfDvfW6rtpHCALnaS50nfY07P3n1fYPVWpkfYrR5EyP0jBL
         QqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422081; x=1789026881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=oyhklPKiezqkM2DHuNJNF5A2Tj91CPUOeEzVYx+UA8W3HrHwm4MJSDih0Jhca/V/7y
         I5F+PyoqMXz+M7Nve/d4aSagONJ798wUw0zaDmxzPhodyqKC3VU1vE2ZrnmgiFvcrjtG
         +G3vAcJa9/HY6vdjC3Jw3xc6PSQ3TBQoQUu38tWeZmfDjXdeApSqujLP7XcMcTVpc/jq
         nHk/fgiJ+42X2qzrvjiR1ruynf5RjRRKYGC5B5/J1XXz8riCqDElcsgQ/pdUR4ITglqW
         n3UGcIswhJ6x2GFbMCLJ/PoslPowDNXSBiLVXoWkFFSlUp5WvKo5HeZYZBdvn2E22MQc
         FDzA==
X-Forwarded-Encrypted: i=1; AKwUvByoX8iceiTnnnBkKNm8nWfpTr3QIEcMviPtT8MSZf7yanJuKSS7eV0STkkoZUOc030L++awHIGsbrDl@vger.kernel.org
X-Gm-Message-State: AFuF++nh9XXMaSi2/7D2GrzJS38epi47EJ8MK1SkBybdcYZAkg9ubiPe
	4d4IZW8CYROTEc4h0Rky6ck7c3EyXd8Y3RFoBCOzXSrcI+rnoNYX+3MeSynv1xcjkb1NTVtJyw5
	52iOkrRUJvip2xDEMFQ3cBu+oua5ePPb8Gs3rz2OUIkspBMlruwXbq8/wioLQSnKh
X-Gm-Gg: AYBFou2E5Xyv72t+3oHa9Z+U38Jk7FCmw+8lsnqu2ahzGfk8DZEwsFcIDS2vNjdPjOd
	AxaXzOcUWjbVuyxxRpRJPbHW1qO/ZoGB88oBF1ALhmXVmhJT0SXr0h+XfUCfwY308xSowWTGZ06
	Vf2ECkjIMMpPCcBQEtf0DCrVXQFj1jsMdT5hf2EOG2mhLZKApylhA3OAFr0Fo2d0O8kz6D5CRW6
	Z6MYqxqt+P4/bI6o1FlYPtDcB1mrAlYCks7KV6BSqHgxaN7jTFmDZwrGbWvGATW7qifcKNLYWIS
	ygZDNKInu3bt9he3/Fo2DDWX+F5C55oNoE2ZlW6ivMxEp9MBNIHZfb1ORbcr01avscbd7qnsYco
	fj090qjYAIRiWazQwouWyHw==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723258585a.6.1788422080673;
        Thu, 03 Sep 2026 00:54:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723257285a.6.1788422080144;
        Thu, 03 Sep 2026 00:54:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm60942866b.17.2026.09.03.00.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:54:39 -0700 (PDT)
Message-ID: <fe6dfaf1-521b-4818-890c-1bb1c413ee44@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:54:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] Enable USB3 for Qualcomm IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jsFG0fFseJhi0lfGTyte-gFC6N9WlG45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX5FaSGoNc/XRL
 iuvXLMXghhi3Ps64beEOoX5oxGH/Li1soAFehg7RHtsIhbr4C5GI1S0RwTgnTVxhJIzuwK/W2fy
 sMIvKvupP4CvY+Y7WsS/XcZhrrdyr3yweyCGOTR8cwwbzAnUCWp6a3L1RsOhMyoJDViqJuafQWR
 a7IlYt941BC6OaTSmchHf/UEORaWZTOKNnu9CgXq/nIoJ+PD8Ln00KM5+1thCa6lJWu0KHHgSod
 jW8VQXkpZPR2QzTDwulM1BiBoeVLiFZTUs512hQNFBquXVnJgKdaySxow1st34rRQ45R0F+1+H+
 dlT5b/kmUjippV64EzHIwABIfaE7a4Vg/nyk2bWHLjaS0J2l5P6VJAMSENADWbTY/WvKVF8lxEp
 eCVtGlYfATcd8+XW6URifOaINgPCSWARO6SM+vVaiFhWJhTuLHhSAd/jttn32bxIdbLWk0g177p
 Rzpgw7KowxPZSN7FW0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXzn8W2hp79Cgp
 QQfmLbT9oVh54rSTc5S2WH5lOv+0kRn4IZy4rPJ/YEctLdgFi1ABIo5/a+KFGJBR9+FuDQR4sJD
 yLEFqt3SjJxfrcjsWvWTn3IEJVp1/6s=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9927c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cwIZyh-EchK-Zb-g6cYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jsFG0fFseJhi0lfGTyte-gFC6N9WlG45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> Patch series adds Qualcomm 22ull Super-Speed USB UNIPHY driver support
> present in Qualcomm IPQ5018 and IPQ5332 SoC which is required to enable
> USB3. This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe.
> Either one of the interface can use it via the mux selection present in
> the TCSR register. Current patch series adds the support for UNIPHY with
> DWC3 USB.

I tried to get to the bottom of it:

0x5d_000 -> usb3+pcie (muxable?)
0x7e_000 -> usb3+pcie (not muxable?) / for PCIe1
0x86_000 -> pciex2 / for PCIe0

_however_ there are only 2 PCIe hosts and 1 USB host.. 

Unfortunately the router SoC docs are very limited for me.. maybe
+Kathiravan can help.. 

Konrad
