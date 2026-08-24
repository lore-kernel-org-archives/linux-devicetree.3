Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377A3F6C39
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564743; cv=none; b=JXgFWQRWubnfQGsQPsxvUyuUdb8cQQ+l+ZFdYUa/s4TMOXGm7hyfNxNqYz4m4LRJNglbmy7w7/57iY01BPzGmxNlVP7uAvf2zu1Qqz2wswlibjfGYw2Bydu3vnzQvjsTIwhgVgqFr0vfCDtc1/nwQs5KMfwQo2Ij3Cc/SFKqtXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564743; c=relaxed/simple;
	bh=bnMvwLJC+BpCkFW9TdFzACHhTy1kTr3HaTfQCl+fqnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ay9dMS547BiRvPgVrcZ7d5mWSjUrLP4hSv/AVBZz9BXXuDcHV61vUWlAIsDTnlnnmOqSFmK2YzL3qFfOuyGvNL5T9G5CkVzdBwlshEJ3zRxNd52DGVfreZ8g1yxEkE92Jf4QBE8rNTa6b7GUII2SOhs4J8vZXtDHlnE2bC7RMBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK3JpMcf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NforAR1x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK3JpMcf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NforAR1x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9WPDM2036026
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWhP727DHorzitrBhFMPh+P+p7E7DjC+OzMOVUqdubs=; b=bK3JpMcfmH3Zn/3b
	pmH8Q82gxyKvR0urfVhkhd3RCIjkceDej+2WTw7sJlSZaguY+0yYOssyj3w74boH
	nAkZXmSIgXkzVb5xNIezE5nzfxRfevvzyWqpR05C8JUO+oYsVBLCvtjgOHlA+TDl
	AG/6fcuWrv71M/WJCZFa2VBwXuEWlHfcaX5lXWQtDmV+kDyilQyXHGhR6SkcbZ4O
	EQgUaMov4cQckBQ2mPyjsoxi+OTCqTzxNViZ5G+U5xyiGxRr/lUDaCmoqBRYmDS6
	hWtDg9clerUXKzAKKHNJiO1/1ETm4mF03GUYIV9n0ttcHZeTfRASkKSurpvqafXG
	QJo69Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsg1jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:45:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so7411351cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787564738; x=1788169538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWhP727DHorzitrBhFMPh+P+p7E7DjC+OzMOVUqdubs=;
        b=NforAR1xOqxBINw5enO0Phxs1SnVIMOYcS46+zmFXc5iM9MaMOLTjn3ePo1A2GStAv
         i90SRQLCy8kre5qBJZGWRXzSETCnUonHsRJAyOmmK9kEX35eXh8/1AavV6YW0E4JUKcg
         OPhicaG1XRCN6BLilhvSEHjmvYfSdSDZMsXelc4ISSnWmu4H/6GREIJP1nivPCj3Wd12
         hVVvdkI9Sxb/8bW5j8bxj7Mk2kTjIuCwDWe+9vqB/nc+uPOcmDbYmejFgsg8trSAf7sb
         0T4YJIHypPnoeHVtetmSJZt5C5YIPvtick1e5P4eeOFvvJ7sG+qNIiyp/F+2oaOAjKbj
         it1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564738; x=1788169538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWhP727DHorzitrBhFMPh+P+p7E7DjC+OzMOVUqdubs=;
        b=nUXyuLoJjDiFmJLao8wRIX9JBy7m7DtzfAaFXc4jO3fBAS2X16VcWrC+NG6u7xbh33
         rog3cMGBN9fZ6fRqfAm93Lhcl3kubr+xHSnPo8tzWp7DKYOZqAEpVveotWgzKMe1/iLM
         S6d3SyEDIhJ+CHkPhNaaUk/dTxpILz2Y4OFaoRyYIhrObYT5hd+ad+jHUQ4EnYLNFYdQ
         wsczM4Ow36WMgluNR4tS4uNpJK9lYrp+mLVHsG1MC9BayE/+SeP1hi9h4FfZfUXNn+hn
         0Dg9muM3DITRwylbJvaG+5qMdpHMPCnSm5vGSYBbPwmWHwaGwyTINJsxLT+WHE4K5+P9
         KJuw==
X-Forwarded-Encrypted: i=1; AHgh+RqKMOc87WSisLCJhAyJ6kQzJMmeM3pjHLE5mgT7TkdjahKUZAR9iDluspL3kPiXAegZZVbdpG3JRXVZ@vger.kernel.org
X-Gm-Message-State: AFuF++mw1EabbhBcV5bgYWsgf+kETrwvGYayKyBx6vFa0/9l+7m3uZUq
	fD+Pp3UJt9Yb8FpPEDOxb6HCInCT45kvOL4nkFVMB7S+t0hZ/tS6w5T3fgfVVtT0JUQX9Nsn3nD
	2BAlX8Hiz72HglPBCbtw7q5Q1akHrMKXmMa3Qfs8x0tbSKVQOPI23dA374Q/UemBq
X-Gm-Gg: AR+sD13HkojymtOSml2meRK1wvO5iq0y3NRifl6C5CK9eDiblsN/9kBRGHdmO9XjEL8
	tQZj4TgivilkhU5/8J61WLkAu+SzB4eRdii90ZtiuyKpSOqp7oht3nsxDMAT74wsqTFe+kuI0S8
	wvMeEu1XjIRgOLI2j2Gho7EXN3vQ4BhtAe0Snq3kvjl+uktvYxzYr0T0aUrR2fA0XDa3h7gj8nl
	zHEktCO3YnkDsbqpH84/lARAXNr15P8naD7tUG2mHEawfcEinTmsGDHOBVEgQM3o060HXBBhFEr
	GA88WGlziJLZCGMMMFnBsJ1htd9V6H02z4QdtWO1zYadB4xW89pYL8lfsRhyFricjW7T8+xioan
	oiZJhlpnYg7Sx5Zz02ofKVh0e
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr180959241cf.5.1787564738380;
        Mon, 24 Aug 2026 02:45:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr180959051cf.5.1787564738030;
        Mon, 24 Aug 2026 02:45:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab63sm1152142566b.50.2026.08.24.02.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:45:37 -0700 (PDT)
Message-ID: <cc20c514-fe2f-41a6-960b-c22592d3eaef@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:45:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-pmics: Enable PMIC MBG
 thermal monitor
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX4AfAhdgOih+K
 rvgwY2yKOxyYg+mrwIVgqG/fKaK0OmgnHZumNQ27i5F1d4HrA9Z09TVaioDXStIoy2/e7R6HjT7
 9ZEYFaCYDXJrhX8gkum8EZWSrCYd+uM=
X-Proofpoint-ORIG-GUID: zBKQw6P_puf09Tj3jO_B0wkap7s-OvZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX49bKqSwD3k8w
 /0epDkRnc/2CO8IwUtQy7lLBQnQXGON0lQ/Bzz/VVvisLqnphKURfpplihw+7v/wK4A23/Umk3X
 5MmwZGKOT0oWLB9qh5ox0wSAD5Qxjam//IEyQ90lkj+RX9f4jRI/Wyze/74MPxKO+PePaAMc6mS
 5eOMdvLr+t3LdfXeVm66NAQfEA2AqOke0AFTauJGG1t5QFN03c4StcN1+R2ZX1g96Q3CNILJa9w
 QV/jbw63UGTXZUYag37mAGKBJ6MddofKH+4fEl5HCu9geq2Al7Qc/ffBMnVLMxbRQ2xs0rynSXi
 n1JBSh+5NA7ffJxOhaGV/HagOwzLMoiUeo0gI55MSsQ+PFZIInzYrkCQNj48IY4UgivdOCv0b6F
 nlFfqbzLNMBC3q6nYxyVB++rgD7Szs/E33uLH5pYRNrdSGyngHk3AKpFnqAPAG1Rdd4hTfs9Wlf
 Tjidm02UTeyH6kqtSLg==
X-Proofpoint-GUID: zBKQw6P_puf09Tj3jO_B0wkap7s-OvZ7
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c12c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YRSyWayBu2VEUMgi7_sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240084

On 8/14/26 11:51 AM, Sachin Gupta wrote:
> Monaco boards use PM8620AU PMIC instances that expose MBG thermal monitor
> blocks handled by the existing qcom-spmi-mbg-tm driver.
> 
> Add MBG temperature-sensor nodes for the PMIC instances and wire them into
> dedicated thermal zones with passive trips, so PMIC die temperature
> monitoring is available through the thermal framework.
> 
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
