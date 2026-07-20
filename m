Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D83955DB
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539846; cv=none; b=e5NE9TCQM++UHCtsIAfuB7kt+Iq21Z7mRYm1KQi4hgWCEXSgjKK9+g+AzageEuNwc6Sy4moWBrkSMxzZ60zEU9I+e1eJbH9Kr0r9PYhlHSf5oSsLnct4PztqRJ4jWYJppkwo1PIT30fMXOYxrK1RFrBTw95PBxzGVsmUUD4VORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539846; c=relaxed/simple;
	bh=jM4UUMBRRP8uRpEJx0EfvPk59ZZg6+bdt8UCUfdTYp4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nAtwco+pN7Q4LbrdU/NGtT0Tycu/YXGZq2mqXiCxhsSLHnPVW+Mp8oKssvG/zOJcd0UAq6U28pPzHVIGvAw7X6VjQV5IbHb2HC1YvJXgtht+OYrDpMmHoXHT4x1orQ7wIFh5trCj1BZG3N9ylDD8bIpABSn2B071N4vmCXpeKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEQxrGW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezoqdS2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEQxrGW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezoqdS2W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K87QGm2000647
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RhaLu3FBbB0/I353UaDphTR2udvrhAv4YOYRhgtD3U=; b=FEQxrGW0DujiLdy9
	wmbkgIsxd7zWVYIt32Gv/3sQSB2hz1KZYUljsIUxwY7pVrTebPAODpV0g92QKzAx
	vnENLZL6cL6BGXmHGRt1dMA02gz1ZUnQrdDzPupamFMA1H1efW3GhVlHJRxGgQTy
	ssmfsRulCX5g2rvfZNAdKwQhfZrGCC/+DrD4s2KGMBEB4rnMiJXlMX4Lp7xN8HhM
	mVbYRvJ8r7A7voilAhUpLy0s1jn0MCJ7yOv/dB92Es8eypEYOLoYZuiO/oi3xCEl
	usMfVFbyVpUQzWqxCiXlDWo02/AAdmoYOlaqhYLkQuy+1zw4zqo4c9dq/T6udSN3
	xkDwkA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgdge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:30:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c08e9c344so22056551cf.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539843; x=1785144643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RhaLu3FBbB0/I353UaDphTR2udvrhAv4YOYRhgtD3U=;
        b=ezoqdS2WZ4bMVT3eMcK95CzHO6a1DeaGVVbA4w30uJXCKiy+rgdTmb0C0vqCB6eul5
         UM2HYvGLnS0FmRj8WOxiTtIS7snCpeN9MfEf2ainEeu7ndl+kN3vRr8mvEQvWsGtpjaQ
         1miEaRO/z1Er2rpv7OKzAQPikh/VGNrtxRVK2TCsfq9iouzxz9CYqe9ma921MtOvxs5+
         OQumHBz2dYopVlzJ1WLCoBc64awfAlzYnwbyz1w6zPBHhpDtr5+AraRlwKmSOfRaDzlH
         glEzWemangmwt/uTjMGc4p3jtAQpNQI5JRheH/VPL+SvNkBPhKGpW+gpIWy0Vvro11w7
         h0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539843; x=1785144643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RhaLu3FBbB0/I353UaDphTR2udvrhAv4YOYRhgtD3U=;
        b=rF9sPpCzGma73EFOT6s08j+Y+t0vPPKso9Zwt4NGsVBkBdmUgMLQIKAW6d8Ms9cfo0
         TnaAVc/27xXLHHONrtcIfpz5FaeiQSNPKktPqCHJ9IYx0aSHZQv7f+oiuy3EVd4iBdA+
         4f22atSVfF5yeXroDVTgZgnoEL7nLAS7BJLB3NQIbF4uzQXoRoLN9cbRugUyAI/D2WlF
         FKx5xWFaYv2AlHyh+7RAUFjWzV6qf8QjX+A1Vh7hwJQEcOAkL5axSlkmgto9XDtn1/go
         KdFXgMZ3gi57HnGw2szMQAiAaXGb+txrB+jYDWTWfpLN0QDMmOKaz0VjufIwJZ0o4SJv
         +ODw==
X-Gm-Message-State: AOJu0YyGfqMCiW3ULY8Fc/MreFIEvXYutngeMXXz1QiJovdC2q8zOLU8
	rMnV4bwv2QAepRJXuyMx/IYZmevQ9LeQCYNkI6AdDRtYBgy6rf9+cawsMKixIXAk9nfY1wzneyW
	78TvyGbonyel//NYcdGdj+THxjASR32Z+LzSFXXDUA/iyrc+vuM94h0e4fj90gC/U
X-Gm-Gg: AfdE7cmCG9ZZ7W3KTYheTsw2uW/hv6B+qxafq5xfYNShWBJFOFM5S9IwJHhvlaURPlY
	Hk3nZr85Hvf9Tj+qel/lvSNxYJ2NSPITwxC24WGstnCELLesLuazilbnr3zG63rC5sCnoJgyZf4
	98LKLE3pfD55+LtLnAZy15WpfZzya0o/mw5vsYUvumCOqH5mehNaEsif2J7DtvSi8x9wQW+fFpB
	SW7xSUm/4/X0GBsOK6sGlTKBv9KFVt1Bspef3bT7vneI23eZbQjuPsML7ywqQPLGwGwGzYmXe5E
	1c/rzwNYnKhf4tigD7VMGhbbQcJtwy/s67Wt74ggtM74x580GEY6pKNMwss6BaYiaoWA+aOmWnu
	h3fXf0SrSTeb31BIO6FzUg/kz
X-Received: by 2002:a05:622a:a948:10b0:51a:8079:795e with SMTP id d75a77b69052e-5213c7e739emr77199351cf.4.1784539843658;
        Mon, 20 Jul 2026 02:30:43 -0700 (PDT)
X-Received: by 2002:a05:622a:a948:10b0:51a:8079:795e with SMTP id d75a77b69052e-5213c7e739emr77199081cf.4.1784539842957;
        Mon, 20 Jul 2026 02:30:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf638asm433035366b.59.2026.07.20.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:30:42 -0700 (PDT)
Message-ID: <a835f571-a95e-4b38-bdbe-88353b863125@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:30:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
 <fa5c5ed6-afd3-4e5d-80bb-921d6f96dfac@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fa5c5ed6-afd3-4e5d-80bb-921d6f96dfac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5deac4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Je0sRbJHxvWcALlGw_UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNSBTYWx0ZWRfX0AhEMX0X3nQu
 zmGtGDoXbLLs/iYeU4UGoxuR43yBQ8p/WRRwFL/hbKkraUQbfsvXbuG/vRPVwi/kHfF1MpC0iYc
 8d9CL44ptwo3By3LvyRN9X0MDAn5k1U=
X-Proofpoint-GUID: JQjuHvyIPSvUVIrgVYDHwGDLdwerQnB9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNSBTYWx0ZWRfX4ichkZSISEvd
 TYUIPME9D/OaLLdVBhcJVFvTHTXfAcFGJJ8S+0Uq8NecS4Ta5FE6TcxRlF2DCmZ8GnLAf8W3OBD
 ssPc0ouiZX5YcfnEVOMtB5fNWbrwHdw+YpFmGqUDn58OHchOE6xxBIq8r6GEPYggJ1YbfmF+SEf
 A7TUJf+sB+hmpgvN92iSIVNGuHmBONU6hwy1I3gWJUXxW0BNJJJ/aHmw+cKnTMfxzq0CHnmjsYI
 utjULylQW9Q4YYrpKSDn0P/gYurTRGEfOXNf9f+mOABC57/QbKyMXo0qVLLmBqc4VD+tc3I9aNu
 5U09VrzMGzGu5lPbzZGf31f41RGl265BefOKspN9ubpxTdd0Ly+t2+nG3FnAvyOO5G3PIav4xID
 oWc5zsHogMMlAQsnNdKtcbduIa2JhRNpP4D08Cbr7YFfrWGotXTbeu9EsvRBqJAPR4C6/thzJSD
 K8Q7EH4OBFdGIyYh+9Q==
X-Proofpoint-ORIG-GUID: JQjuHvyIPSvUVIrgVYDHwGDLdwerQnB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200105

On 5/8/26 12:32 PM, Konrad Dybcio wrote:
> On 5/6/26 9:56 AM, Manivannan Sadhasivam wrote:
>> Recently, devicetree started to represent the PCI Host bridge supplies like
>> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
>> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
>> the Host bridge drivers still control the Root Port supplies as a part of
>> their controller initialization/deinitialization sequence.

[...]

>> +	/*
>> +	 * Since the host bridge drivers parse and control the Root Port
>> +	 * supplies, create a devlink between host bridge and Root Port
>> +	 * supplies. This will prevent the host bridge drivers from being
>> +	 * probed before the supplies become available.
>> +	 *
>> +	 * For checking the host bridge node, first ensure that it is a PCI node
>> +	 * and its parent is not a PCI node. Only host bridge nodes will have
>> +	 * this structure.
>> +	 */
>> +	if (of_node_is_type(con_np, "pci") && !of_node_is_type(con_np->parent, "pci")) {
>> +		for_each_available_child_of_node_scoped(con_np, child) {
>> +			if (of_node_is_type(child, "pci")) {
> 
> Doesn't this go a level too deep now? (a change vs v1)
> 
> for example, in x1e80100.dtsi:
> 
> con_np = &pcie3_port0
> con_np->parent = &pcie3
> 
> And I think the code now looks for device(such that device_type="pci")
> *under* &pcie3_port0

No, clearly I managed to misunderstand this.

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Glymur CRD
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
