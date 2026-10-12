Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2C130C165
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792689; cv=none; b=NHaeNKIHtxAdkFKofAtFkZdoYRRSufSXzFIYvqhxifdEW1s1bfHGgsyuzLwmxpLxa0uteojtHOp5vkZp0lXbNbDiD83Evs7Udzzi0FgEVH7DbTx66CIC/CYWrCe9GHNUicA5UY37Z4CTXMmDtJZXnDqg0CPVtUE7WT23th529B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792689; c=relaxed/simple;
	bh=jW9DgEryKOln5zmCem85gMK6wwxZlbIDKdqO5U60gmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdaV2bldviQj+MKaNstQdOT6o2lhjbYmHb22Tke3UiKxOKUiJa96DjDNVVOHKw/i1rQO4bhRg7+ZP8fS25HLgiMOVtL5cwNYZKAjoWHKSPzGacb0A4xEe8xQovR5VyrTKhIWrP52E4WfPXwMaHUnhd+J1LtKgtXTRU+QGqxfbYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCRau5XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULAQ1nxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCRau5XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULAQ1nxU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55d961314467
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hca6gRjmlZ1Oqo6fJ0KrK0zMcVO4xzz9HK6VBcQrJeY=; b=XCRau5XUe7UTWjmu
	alwQbGyvSWVhDQHkPFjQo00rBL5omZziZ4L0IeNNrEEmPzoQDizFpeItwt3jUUOg
	JVaEB4pCL4kQtw4jqQ2H/8iVdIp9Tb8vqIb3GwpdW6F9rPAMici8IfhVENVsZQP4
	iHSKh9KofwUb3tPtTr4pSfHqALJQiS/3OVrX8EdC0pZnLXAUTuUU7uu/qI33BAmh
	awZI5giaKjpyBr0QtM8wpCt4IutQjpnsZDcAVF9JCe/BLIFOC8HNCmFFLyPBzCNX
	Oy3H8m+HXYVDUdLfFn8uYJTEiUOLDWQYd+QbUqmghoVt7txwscXNBg6KTTw2YU93
	YuI0zQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711qye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:11:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1243062a91.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792684; x=1792397484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hca6gRjmlZ1Oqo6fJ0KrK0zMcVO4xzz9HK6VBcQrJeY=;
        b=ULAQ1nxUbRJeW80Y/xeuzJgsnMl4sO8EkWFTUphSYy/1g74Pi8X4gfrzcj/3QL5623
         jsEYqZ9RUIUgZHe3qmHd7iRxCPhKHuWmuDzFTEmiVRfIWC4q0TSPy++brrm7QIkTEL9T
         g1G8zyAV/H7A2oJ9e1w3/oxz3/7K8O+7DDzoxcnRnoyM2PdukBFvlh15pt8jm+VpF2/0
         adMuRL2PtnpvoK3A15eUGXaQwrP0qws5QWlTZIxa0cLfcG8XF8HfUVSDwNSfW0tcj2e0
         EtBDhBSyTyYNTe3dEqoy7wHZ4I0+VFAIk+6nr4EtK9ftFSB7tA3WwvGh0jhHPDwRGLRV
         SdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792684; x=1792397484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hca6gRjmlZ1Oqo6fJ0KrK0zMcVO4xzz9HK6VBcQrJeY=;
        b=CJ/Y+HNokmhH7wKG+aF7ktetCwMF+tg14Tvl1vrvfyCLouLDQN/Jyy/mvIKwZ57bAw
         ESDP40YnOxvnXB13hAtT67ckgihkKV1dOSC6C/42It6Hh/TB5cO1LOQVJ2QIRdRjq1Fe
         JOa/9sIiS+Kph8A5EebZyqO4AbOchwLIjra1CLrE/r7R7bH4idAW1jGBML7r0xPRq/gZ
         EX+5WDDdgdq8GBItOBTaHKE1QRXxNMeW+BpLRqQoHoE9ixSGiggfql3UK70OaycOTRKG
         dk5wC/kYpFlI2ksoY43/OYeon/Pasxq8LVmzYanpo6fWwL+ydRhDIgahGd1XR4evlPv1
         0avA==
X-Forwarded-Encrypted: i=1; AKwUvBw2IfL3fGGoc5j1UPqKF17fNWar3lSSIUZrDYzzVS9pyW1T80NWiuE+glevi6m3ltm0mc9A8iXzNtEs@vger.kernel.org
X-Gm-Message-State: AFq9FYJJvgXFpYHrpeZ+vCPj1bcGwY62ssHGxtsHfZO61XzwvI2CQ5P1
	EZg0jzDKZJoDOxnrCRS+LDEmRmgu02poVZ9jGju8HKzjG6HBRG4R1GLesOEgbANEjVXDTBUpY2n
	1oEkeqhbUaZ4EhTYLN2XGhNDwZQO25uWJyUXGLWpsnQXBrn+FZ5ZnaHG/REYIVmdz
X-Gm-Gg: AYBFou0O0KiptMPJMULADMcOu8RtJaKofzEnPD+c5LeNXzKZRDarLeZY6P60vXGCI+5
	hqiGsxXRqsy+t7x0/f5+Aa8L0lsS3N2gRBkjd8Za+Lk0DLoX1VXjAymR1xP7DgCpoOvftu2joo9
	pxsjdvfWowFs6dBa9Qom7Tx8R2iKJFnDzT7nZqBDf8y0YNPtQXwzF1tef95RMS6LCZsf/Xw1B0Y
	Q+b0tgGqHWcBlPicOe45vBU7jh4xFdAnIqkKrK8nRUozSBPgiZEC9IMA7TL2avW9rfIGmQX9YjY
	7nFQnSkk0YdqA2JbOlojpij7dXQz26aAwAl8WODlCDnqMkRrkCY3dKwrIw2C4mceUurlPDBh3vB
	HgtoxqPQacfV+l7JCkwzeNqAIaQk=
X-Received: by 2002:a17:90b:3d48:b0:3ab:22db:1c0c with SMTP id 98e67ed59e1d1-3ab3a7a1531mr7404335a91.31.1791792684174;
        Mon, 12 Oct 2026 01:11:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3d48:b0:3ab:22db:1c0c with SMTP id 98e67ed59e1d1-3ab3a7a1531mr7404316a91.31.1791792683627;
        Mon, 12 Oct 2026 01:11:23 -0700 (PDT)
Received: from [10.239.132.75] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dc37c2c1sm2903194a12.6.2026.10.12.01.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:11:23 -0700 (PDT)
Message-ID: <0421269d-1e38-401c-b735-4304d3daeb06@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:11:20 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: maili: Add base MTP board
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
 <20260929-maili-dts-v2-5-965688646c4b@oss.qualcomm.com>
 <20260930064017.E5FE61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260930064017.E5FE61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfX1ZsYlADUmjj+
 HJTNENRD6Cy9dwR2lbRO5rgTR9u2QiHguWiabhjz0/qBsI2Dz+oGiPU0gY5b9YeZtpviMEm56By
 Fv9esQMhvvAf//N0IVSkOdFNgpk/8/o=
X-Proofpoint-GUID: AfjzMRCC_qTSejBgOapTAy85tOGyoprj
X-Proofpoint-ORIG-GUID: AfjzMRCC_qTSejBgOapTAy85tOGyoprj
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc962d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EdlM0BD0ab1hFOwXSe0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfXxqa02YPCbah8
 D8HbVqGGKamTCIlV6BU8pnj3HiKtsVnPxIf59uMV9f1WWo3Osjdg+2h8vx/0z7Q8sGsE0ErFtoP
 0OawVSWwsdjTD8q/bxRqqrOXNugj3hQYoVBjIScGX+DnubEIIadHWC4QOo64fRCykkduIeoE4j0
 zYyaVzMd7x8R6Rx/FpgpU2/4o5dduYfrnTPu+wRblUWk7kla5CfgD4HkcQjAsMOuxz1lmlkQZk4
 saz43b7iFe/IkLa8nX5WXMddQLvOw+l//JYy037NUlJhrALd/d/D4M/mYffFm3kZ65if2xW1LOU
 aParUhDLcUZv3QP8XN24+UzI5+O7+sK13dywn/MJZF+FSU79sqskx6oefCjSUPjg/EK22j8BOnE
 RO8cznjS5YSjBxEbayyExlMzps3/isyf32u9Oiv39zv+RjeqpIlqFXVUyqn3yXjZujxQMdZe4Qc
 e5FZplEy0ueh2golTtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120032



On 9/30/2026 2:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: qcom: maili: Swapped vdda-phy and vdda-pll supplies for usb_dp_qmpphy
> --
> 
> commit 52dffe9df955d99886bd7c5b77879c715dff5003
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> arm64: dts: qcom: maili: Add base MTP board
> 
> This commit adds initial device tree support for the Qualcomm Maili MTP board.
> It enables booting to shell with UART console and configures features such as
> UFS, remoteprocs, USB, PCIe, SD Card, and PMICs.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> new file mode 100644
>> index 0000000000000..1fdc91e03271c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> 
> [ ... ]
> 
>> +&usb_dp_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3g_1p2>;
>> +	vdda-pll-supply = <&vreg_l3i_0p9>;
> 
> [Severity: High]
> Are the regulator assignments for vdda-phy-supply and vdda-pll-supply inverted
> here?
> 
> The vdda-phy-supply is assigned a 1.2V regulator (vreg_l3g_1p2), and the
> vdda-pll-supply is assigned a 0.9V regulator (vreg_l3i_0p9). Providing 1.2V
> to the core PHY logic might cause over-voltage hardware stress or damage.
> Conversely, providing 0.9V to the PLL could result in an under-voltage
> condition that prevents the PLL from locking during initialization.
> 
> Could you confirm if these regulators should be swapped to supply 0.9V to the
> PHY and 1.2V to the PLL?
> 

will fix

>> +
>> +	status = "okay";
>> +};
> 
> [ ... ]
> 

