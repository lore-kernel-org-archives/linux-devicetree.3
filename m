Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF79392C50
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327263; cv=none; b=bpaV3C3xH5L/7gbSb8TmYiXnBa60ttvEUZ+VtuePqPSiB3NUFsALqDPwkR1SDsYf5XE4ajPn1PAJZOOeKfPcoXkkNzpSinQAjpyQT0QcB+fJDWbfZSb6SgT4nLiVdHiAbb62lBXGU4+tudmU4WAqGH16wA/qEM48BIvy6P7dga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327263; c=relaxed/simple;
	bh=7HIufWt9gVRK5+mC+4O9yuMIN8y+dLQ4wRKFYCYSneM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jlj/EInYTJh74Ns52BuTXTDuJ5BsCA9CbgKgWsVaIltgh6hbNuoIr9XL239l0M/7WKmIW1WnBSrsDedXaDNNwNLHH1Kl0iu7dwUTUCzWHpPCZJ2RcRLR/fza5jHmY8cfQACZosnspJEhqIk/lVmuPqr0FCKE7PWNVQCgG6wuTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq1jokot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REil/aQI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq1jokot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REil/aQI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641WmD3615514
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=; b=Bq1jokotQ2I1ybSW
	pG8Vbjp5cmexg06ZgOo7HnUcdoz++VQPK9jPrlOoDYzoLaJSiP00gdk3RZV0dGdl
	HcnOpMe8UkqIBbOu3ID5mXiOSHkWrGbn/o4RaCjxI7TUE3YgSMVyeOJwObJIZWFS
	L6e5Dw8FpN9uUp9oYfh03/1X7e1Pt8FYvReYZBaqUJaha7/g0J1nEXVeTp/lerEH
	7XARdYrlxEjVDcYf3Fy6sF1V4rU6mnKUJk05/6VmOOVk7oPy1wh80CgeekGFEm9o
	MGKW5oA9Usfw+0K616ZdPkKF8aVVNyBILDw3nWtqR7P0oqKYiMrsCQD7d8G0vY2b
	yeRsBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3daux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:40:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so10803771cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327249; x=1783932049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=;
        b=REil/aQIioLZU2Hxo8kNMEIrh/fh8pxg3/1gFdI6jSX2SkiIiZFcWN8Soz+tqdl0wT
         /znHbMrYW0I9tQTo4aVqBKDSAqcRiKlghlSyhMNcAUi0m7oRZUGbKzs9dl7EHFZ66IpK
         7rWpjTtJsUJ93omy32ld/3KtC6mWqV+f+xP0o5BOmyt5+jM0wxqyXqQBKgta3pXoFKbX
         hbbGNsj6px6UxTSn12c09yChlWjYXI3fnAZaoniNOC4qbG6Q9lW92/CTzAxjuqmfoYhD
         x8NTdwqPG1X7EAKrtjajmW4/Q1ztg4BvcoGH68UC1WLfdirIVH+zWRZUCvp+MaXzfkK7
         RyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327249; x=1783932049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=;
        b=iNzj35ZoJR8oLzVaIJe4d7PdgAZ6pj6dSUOmuiq1P3Tkw0RDceyfo1oQaMU/HALWLX
         KD9oa+duho3U59jsJGDimjQzgBqCfJGL9CGoZqzIthxrruGzGeHuwVdEHispKdz3AwIZ
         DhB9VQrUlCgh+SVNMBkvmdSgyFnuSFq69afc5mlUdJGbGIc5Oanu6SZyYpC9eqw50ViF
         3wB1GZCAXr1oxLMIdvSIYVH8kW8AzRKsG/Pr9u9snZ7/g68H2x8CkM/fQDUFaIbiKxfG
         EAU3havQhqjQGQ/ziR7bfPTzWozuqTXqS+yOzmFAHk62Xl6PNUDs0cDz4UqRvjCmmhC+
         Omgw==
X-Forwarded-Encrypted: i=1; AHgh+RpLss3DLzjvQ9CLK+MMW9icHq1IoJdgBfGs9VQ3NhPW2B3fxPVrt4n2cFwGYt1gKPRoHCeqIkaLAnLC@vger.kernel.org
X-Gm-Message-State: AOJu0YyLrhSpdxqI9mT2vAKcOHWEOefyLTEeeZbW7sF1aC4jAzIq9LUx
	Yit9miqTRoMror4t+ylg5sC/T9yHD+lx1in3zLrCpJlIkPvy/1LgsmAFp18eKWGNEhffKrMCDvI
	yevcDZ6EZ2fdg0EQjYjzEwLry6U8+Q6m32zy628HFBaJkR/Pm2T7MfdqFwSfp113A
X-Gm-Gg: AfdE7clN4vtmeEg2G68YVhgk+TgBpvqlK5BLngfBW/zj+2Bb+y7XKZ8RDRsVSpPG1y8
	wbueiS+TorNnIrYClOPxLIK5sSyKHQP4Lw9tdm33DpGB7zhK4r5jn1u7FicZ/sszfPWmsH7LJ7C
	W9kvB6vudc1RCDoUeI7aoCVK/YaNv6X/cJfGLAzSd7CWGtwk6HYHwXgVkLxQUPk2QYU82cKV3eL
	8GLuK0YDXSo2t7W75OoqlwLb579pOldVdUcIqIC7euLsC4O803ctpXxnRIyGlrEr758bIKOe+ib
	U8Tv63SHSqdQNJJkZrwnZLNpMcXZ8XwchxTCt4W4z3nFsg2TidDQ1khuSs6xiVn8Lab14+Vq1nO
	iX4T82Mp2Tos9hyNNwxrPRaQkvQMAaVin8rA=
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr84324621cf.11.1783327249008;
        Mon, 06 Jul 2026 01:40:49 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr84324361cf.11.1783327248523;
        Mon, 06 Jul 2026 01:40:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4b52sm690724266b.47.2026.07.06.01.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:40:47 -0700 (PDT)
Message-ID: <0ae3a788-2061-4bee-835f-d08ecb2a1d39@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:40:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/13] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX+jDOo1ynHxDu
 C7gn51H1VEYxj1uL6ifgCLQ4gT+HOLSv3m9uMbcesTdmyqRT+TKQbl5sz4RXGhm5gzttuGfBZd+
 iheKRPZo5ibR1JmOOTtgXD+txxg5CoY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX6hf9yxvgBhdS
 J7Ns0mkMerdwTGTe0mxrBD8X7pJSV0KDVTLBMz5pyk2KXvRj7/95Oki6lq2KZmUNeHLgcftY2pr
 8IPIsSwcBfLiQSuq9GV0q9h39shlK6jBk0L/CVUubfOKaFqjkO/YBq2/luUaNlMvZHrjNqvjoT6
 cZbmrtHvBIID2S7Yj+dd8b4Oyxwe8jh51xO1xmgF1ozWG0v5/5OvWkkjNMI3x3YW43YSo3UG0hg
 HS2i+/O5tMK1gjzNc0GJ1V5LPmdEAOSOA5AhL0a889go+heZ2TZzlBeXFfjbXCKf3VxjhFL0aVZ
 GmptgWmxaJ1GtwklxQQhGZ0KIbqvB+cjKxK0YXTzrDtYSY0rxzSUCyJicEVDm1pJ2QAoiKrjDVe
 0xmFpV6sw5k9Y5mK8dnCsiZuK/qYuV8wFgnz7kxDDfxslJg8qkbTldctF/CLk1VYRmS4JsHA77z
 E7cglFulkxyh5tDQWpg==
X-Proofpoint-GUID: 5rQD7E3o3IxELfK4EEE9rFFWs45IKhRC
X-Proofpoint-ORIG-GUID: 5rQD7E3o3IxELfK4EEE9rFFWs45IKhRC
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b6a11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=cDqsbA2g2SHu6s1Cd_QA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060086

On 7/5/26 9:13 PM, Anna Maniscalco wrote:
> Previously both SID 0 and 1 where associated with the same domain.
> 
> When LPAC is not used this is needed so firmware can acces memory when
> initializing using the same page table as GFX.
> 
> To use LPAC however we need to move SID 1 to a different device.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 1604bc8cff37..44e5f9d4b335 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4133,6 +4133,13 @@ tcsr: clock-controller@1fc0000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		lpac: lpac@3d00000 {
> +			compatible = "qcom,lpac";
> +			reg = <0x0 0x03d00000 0x0 0x61000>;
> +
> +			iommus = <&adreno_smmu 1 0x0>;
> +		};

I think this could work better as a subnode of the GPU (or perhaps
if there's no "actual" separate address space, maybe just iommu-maps?

for something also making use of the latter, see patches 1-5 of:

https://lore.kernel.org/all/20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com/

Konrad
