Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE154381AEF
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401803; cv=none; b=bQWNu79pGbGmuQEst95hdIadQaoWv8Dx0b4UNC31hU0UaPunGib6L/RoOlo9Remdv7kSzCgl/1PHbGuznbKNEwfP9SupE5VfJJe2n02Zgq5AAwf7CyE1iBSawq0VzO4ue0s7gKdUmr6S0tCGKdODtRmeHlfjpYuIHywnWqYM1To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401803; c=relaxed/simple;
	bh=peGGlS9T+0QGAn4WZoFX7AM8oGcbad4sPBi8yOdOmGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2oW4aGe0e805ncpFH4uqePgiWN8ZgCHkz3+sawecu49/TvpEc8p01qrLvDjIZAXy56USwgPuxP7Dsm4YFqNWIJAcnHlcfB3s3fF1dfNPbNkaEcjjzgQlbGQ0fjT+D4DiOojLbpLtclg2X9Kcd1QR9o6XOGuG3sWg5bkw8K9KpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqYbHEkU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVBNju79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqYbHEkU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVBNju79"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674959c2498869
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7pRZOt1/C2Ak+fJkICIGu2A8CugiPqfodDTcjzFu/g=; b=gqYbHEkUQi/BF2lr
	aJXjM8Ba6jvYOnAMaU8N+HK1J2fGyzErKUM5dsZP6kzQTDJTYvsg7/edkE6J/6ob
	/3w+y2HMcQ6uQZt3jCup/rtCteSYNFhGTo9hzUDqEEG/JBByTw8P+42LSGkBVwut
	cBFM44qOZI2sPVtwzawpk4vxVJR5Ap8T+R7sp9ZSKl1QF3DcLdse8SkR1s16dy52
	vW0eX71WC6z3XcYM4LlTTIcwumWleJsC3P2EQN78yeqluiDX6ng5ur0wsbY4pdjR
	x4JhsBwHoHFiaT0fQVShvt9XvzbNl4y0rnZTB/ILlVWMRBdahdjNXWeZg1FH+bTf
	CsrsSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscqc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:23:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso7795905ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783401799; x=1784006599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7pRZOt1/C2Ak+fJkICIGu2A8CugiPqfodDTcjzFu/g=;
        b=GVBNju79Q9RbhfLvoecjoI5W7uy+3+xnN1j7/6tOG4eA25zLCce2fVqN6nQ+TuSzG0
         4DKpvmUWzvIRyIU1DKUaIW1bf6d3JIcT7Rf7DJdveqkWeKocjP2igBpJAwO5ajt+q9Xg
         6OCABIPsk9e1g+GnIRUfsi2WttAvHPa1KDs4N9zDl33oblhe1JjqKbugkUZbGQ2v+Y0T
         K7IoeITBV5VcDjZGUO4EK919zGVjGKccnBoprwrOzCNDvZLUwffsxkuVee73cRS6XOrd
         eByjxxYuZrPj7vn9jVhp4dhqzvmriji6RYX++Z91Q7Gw8+nk96lxFAw262clHzOdk+lH
         duIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401799; x=1784006599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7pRZOt1/C2Ak+fJkICIGu2A8CugiPqfodDTcjzFu/g=;
        b=OHUJJV4ApPcEOr8zG16c3w95MDz60hZDqQMDO4Ll/kv2+nOOgQ6221948tqgr6x7is
         7JHP2tF2pCXBw3XSWiNrOYc+WJrfF4CTBfPkKeebbCPJmpAtntwKHUk+Es/C6g6KlNZZ
         5u4Qe13+Ui7XWKTHNFd1F1Q45BADlIXzJsUEqBvp1Xd4H8G9jtX4fZJEQXsAcZLEXQvp
         xRF/BSyGs1GpoAeTagETehEGN7RjoG1VWmd+YDEVoV0HZFe5VVCcCKFzNdrcB04fxkAr
         gZKWtx2vZ+slea54SRqP0xl70OkhGZYS2w+S0Heg4XCLrZoUP2WW7FVWAoFujYvXYieA
         JaXA==
X-Forwarded-Encrypted: i=1; AHgh+RonSqQYGU2KrDW4sld7XSdnJxkBqKqe3hqMJwefTc4jZw3gRdHHPvqnfQxa+Nvu5xoehnckkN1nvwfI@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBs7ju0L3G3LpTJoGly5kCr+XSX6w1+rS48f4Brz1Y8c0PK5u
	hGHRJBuutvOff0mjIIJxYXJ/X6XFZSrv7z47N4Ac9QC9pHqn50K3IomvaOjfCVuVgWT7al6zNgZ
	tXDwclG+wkbxPQFLVG3qQnHxts7EtKuLN4iq5clCAsc3dFw1NRQVtKCr9zWdnDDnS
X-Gm-Gg: AfdE7cnkQ65xLPItPQFfiXMqV095Nl9kMdbRrokJGAZbYgTanPMN1FlxxW+l6ih0P5D
	KnzAPZs730NP8+SQmtKaYLO5yRiLSeE/brLLzUK/JWILa0nX55Bw2S6gA95d6lebC9Wx2V1C9/8
	ddQyYBtLc/MdZ5+Hlbjp9H2A5OJMjKceEu8wKt0/1MGYMPxezV6jildqZWykJzbN5GVN5aww7ZT
	J+gMStzsuv8CqxAi68EgBT/PftKNRtUTYWQKTTVddyOq+ap/wqXQ1bav7+C98oN0do3NZ++yDpU
	Dm33n2hCCEVwdYNCJOxgNhApGW/NydSxk5MNmZoMjnjOzcs+S08f0Z9MJ45PXGWienJ8LFs3ZnU
	hcHHiscXlUsiSooiy36URIKUuBuxHdI4OwLYW0e/enCJ6z1l1w64s5zRoULi9bdH0D7Uhbhy7v/
	QHdbUe
X-Received: by 2002:a17:902:ecc7:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ccbe6134f4mr39951875ad.13.1783401798789;
        Mon, 06 Jul 2026 22:23:18 -0700 (PDT)
X-Received: by 2002:a17:902:ecc7:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ccbe6134f4mr39951445ad.13.1783401798269;
        Mon, 06 Jul 2026 22:23:18 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm5020325ad.49.2026.07.06.22.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:23:17 -0700 (PDT)
Message-ID: <7e4c6924-f217-4b43-a5af-827cc3c517ec@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:53:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: shikra: Add PCIe PHY and controller
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-7-e1a721eb8943@oss.qualcomm.com>
 <12e86cc4-d96e-44f5-8c87-87a6df321115@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <12e86cc4-d96e-44f5-8c87-87a6df321115@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7AbpL0OfRun_yvkyOcc5lTsb9CbGobQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX7ONV/zFLNdut
 VG15D6+GGI5zajazHovhqpjcaRnxpLb9eccLIbgEcgH1GCwT0ZK8rS17Nyk3DAgWcSRTK21aScO
 WrSh/M4kbnxWkVAdDD5DiVS9jSa3zb6z9kewxaPUtjLAqEWwZwSR1kxRS/Ar8lxy0X9cEF/dcrA
 2gfsVGXxE7z01tAGcBPbPS/P1f8F1pIypi0afBXH3j8wriGQsAjeUaT10IzdlKiGNtxgpgGFl15
 hbiZz5S5get+C+Tbl/VeCG0KaflOB9/3vVNSjx2tpc3rgiUpciFANgEjynNI1RLaTrQHia2alGl
 9G/ITCipUpPbZND8xJls4hl5m1SlUig2E2xKH9XzqUYykgBLb8pUKokeM8516nmQ2xuhq5RyXTu
 oRQqwSCHMjEILb57PTqXyqVnWsz7nZ3wl1bnhfdl849gKzi0U1JlQAhQlxDOfWB6GMKpFb17DXI
 jjXDXvxaVGeXxFlkDPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX0Bd0yRGUy9ab
 kmUqlISRZMtsQ5GH4mhflY9RcdmbEzOrVdBwfmPpdd71Au+lMlRFBuagPFZHJiIDK66iCLDeY2/
 Y8GWTZjT03ZC5LZPfs9DQ8HLkm4TqWk=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c8d47 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=A2pwc-5Qy5RiWZamnY4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7AbpL0OfRun_yvkyOcc5lTsb9CbGobQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070048


On 7/1/2026 4:04 PM, Konrad Dybcio wrote:
> On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
>> Shikra supports single PCIe instance with  5GT/s x1 lane.
>> Add PCIe controller and PHY node for this single instance.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
> [...]
>
>
>> +
>> +			max-link-speed = <2>;
> Please add a single-line comment right above explaining that the
> host supports higher speeds, but the attached PHY is only Gen2,
> so we need this manual limitation
>
> Konrad

ACK'd.

Sushrut

