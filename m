Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309963;
	b=DdQqbkM/5S1b4TPb56N70OuuxcS8Uy1CM0GS+4U2FUbsHZqxGDHgV0KUmmt3P0sSnL6S
	 3C9t8MilJmaqt2egwvdYvCHGdRHv5XzOteHJ9w+EqHxR02nD83jCOZ+lMcDLHG1kPPom8
	 +Hrhfo0YCTJ2JOHEKHw7sJFznMbfGa6cGl0LElORZAru73dc70M/NkrZUBkKT3vq5zUEA
	 grdEAECxKvU7yqiZHZTZ29ilsrImJOWlwO69Hod0qHRsOOc2hBORo4yHVkjhdAjBKtspF
	 LMtwnubtfr+wGcP5CN0horI62Byx5FosXiqlVms7MRrryYJYX/nDonQXP1YVaD+4dpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
	b=T1vn4ooVZ66GXQNTNcHFKYxrlbxAFQta/2UjxjpEbzYH1SfzUz+M7M1Hnzq70XuazyZh
	 wQa12nG1NJUuhjE8WmBjeQPrybcmmwNEh2rVURLXerx46NfegNeh9Mqc/xXVsqYaOqS5b
	 CK/O+rY+4+TfNLNuwxdOLY61p8ZqOh52BFEl7kru4uHNVNdT95dbUL55fa4RTB6wKql5y
	 RNLTXjrsYIqkDWZeGP8TEkyKlbbbxFJ4TmvU/deV0uHoGnHBwtTBHhtRbvqsG6RFR+x34
	 DX96UOjS91qiQcI9ZQM4/zdfzBJ/58HvsCzI1gahNljls+Zr0t1NnKxLuv/KiSxMW5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92lIBLz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMMXIjSC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288D606A332
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C288D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92lIBLz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMMXIjSC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABALbx2881372
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=; b=J92lIBLz7pYKGw8I
	gZYjbGVL16cWaE8Sz+HU0uAiPYgVwztHHmPRL2TKDdY1nIehM3EJ4hYL7xLtUqqV
	/5NscAeXvx4qccy0nmqKQTI4bqhuU25c8v+jW4OxoDjmTBeDbDaEn00DRYOZa4mO
	dZpftPY/ClSCL+wHZ53Dj1NDQxfnc8UiDGar6i2ng+XCorBR9HTh3N9ZofF7T3M1
	tPEAh/nGNmiL0cxsvxJtByDCPF2FpbFpBUGfoXYjCnxdSljFMaYsSrcJDGUdaVcs
	qIxQ50h4OJul+438na8X5PJsMOHEPpQCbix5jxvvSKh2ULmO2biLNVUiGESYw+s3
	g4ZxQw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84926n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:26:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso2630891eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309961; x=1794914761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
        b=hMMXIjSCvArpbAVB2pG3tviVjfF/VMqStvKA+u31AUt8Dhlejv+bfF0LRzAJ3gx93U
         HyOS/mgKmNSQAbGkqlEMPthzkBxg8wFuIVTP+2jyMRKZViv6IW9gmzOTavVXwRmpxorc
         5YYbR6ORP5kkB8MI5E8iWC/cn2qJk+8C8l8cVYEy0DUIbjc8Xr9HykuEpkARKlzRR9qy
         rlNBrB+CgqGQUeRXWUsB2sK/bZRUBW2iSXOpZKF0MAiKf9raLDeDNKCYFYLFFjr2noiy
         dIyBlt2sbDB5VW9vVoGN4ck6kJGmcTlLbJdYSIubW2TsbEvo+tDyD4d8Egg2K0XpFUdE
         OYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309961; x=1794914761;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
        b=0wmyyuY2lqWXs3Y0F1mVkO6Db42uO5OaiSHWjSGOaOdASIObZsDbcrO2Mpn5m2PIQV
         M1IqR6wEQq4ElJgD59wbja0zjEtAjLnncLvh9ziPYLrdAfkL/hTJMd4JmiuLdnE7ZgXW
         /3016e+wap1T90U/BvG2Q89NbKATtcvPr+Q5DA+fzgPTOJKn2bu1B/fhdXNvZ/B8/lDx
         7ASNMT56RgSjxcyXIHGv7NPBfRRLrCRM7LkbmHO5lNpj/eliGVrw34fbSSnan50IT7dY
         qEg2khW9d2Lfs5R0LEMaBBO3WeeSjpLdmbc3C/d3IVl02sKgWOtezGlQHaUvy/6PU1On
         E8fA==
X-Forwarded-Encrypted: i=1; AL+hErGC3pDXXIZLy2QUnJroc6ErgGv+A46PEIyKFTyYx6wYZcACjTYpVa1t3xqqy02af05XgnNtbffkFXch@vger.kernel.org
X-Gm-Message-State: APuU4Z+NXSWWq+PzDUQxsqIA3wfbBXHr73N8iCdBDipgA+qBPcOrw9Xf
	BZGGTyrePEGnEuU+dfGMeCdg4k4SFJIqoc/4AJzk4csQRIEhXWshxo8+qMIiaesPDN/IGSrzw2V
	XPX9/aK299O01WM/DP1zi7OFEtHnlZ1PjzJfxAe21KWOv08Q8PVo9NuS64xR0Nwva
X-Gm-Gg: AYBFou0S67QPLvCv8gVfn/cv4zXjtiLM7lNAnvP2K8BwB/ymx9N9PlFByxuvQoPNmG7
	TI2zloIArVdQXLWmQ92BbSCNo2eaPeg4pcuFAlIsbR4DI0KxYSfuuwU3WBUnvRY0pO3EL37F7W1
	Gx0kZPos8w8cMhi94Qohuo/rfPIRv+428a+1mHXHjfC9FMqGK+R47orpHveoKKsSps8c/nWeTeB
	FAgcVOWxb7ChobxHCPKUV9RCVwLCGNns/58a3CBOkDjLpRphroVPjzwRz++hcnaIapjCMTa+Cr7
	Ej5of93ZItKZQ2/hhH6ADxPolZfo0EEZpbuNfRB+7DLOM3IO8YiwrZmGbGazCp3Qrt+8vgzAKDB
	qrWrIn1o/Z+Jcjoim41XX9RNuNYQfFC1LpRo/5pzR5PA03/QnpajytYjO4mj1bYAP/VAfoeeywI
	1Y
X-Received: by 2002:a05:7301:6194:20b0:36e:d060:8bad with SMTP id 5a478bee46e88-3751c53edd5mr3132145eec.5.1794309960546;
        Tue, 10 Nov 2026 03:26:00 -0800 (PST)
X-Received: by 2002:a05:7301:6194:20b0:36e:d060:8bad with SMTP id 5a478bee46e88-3751c53edd5mr3132114eec.5.1794309959917;
        Tue, 10 Nov 2026 03:25:59 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm6930570eec.7.2026.11.10.03.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:25:59 -0800 (PST)
Message-ID: <65133a8c-7b10-4429-b870-62799cb50d4d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:55:51 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-3-d528c7a797b4@oss.qualcomm.com>
 <20261110-mindful-snail-of-business-fa211e@quoll>
Content-Language: en-US
In-Reply-To: <20261110-mindful-snail-of-business-fa211e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX4FDtuthwQHw4
 u3QW7GfvJMvCCqwUDRWXDonXzl2awEILoMoEuDyFB0G8NRYJULG0GqPFKfi6loggAj2YHO15k/u
 U/+ah7h6W1xm4aDbNbin52lyxpnUHXFIvxFDEUP5lOmusjuAP9ptrUGg6vvb/ZPYvIE5PuYmtyQ
 gACp5B5bI1kCaDqLNjwYmfdymQrTR3o1MjLA68mf8Cx4I4u8S5oBiM7Ttb1pgceqPGWbHLKtiAy
 HLEGAtlTzc/pIoOxlf/eCHppIPHGc3qOZDr4q22ZmbxoD/jfjFcRw2qD7uP2KHKCb8FF55YGbsc
 XqQnJsqc+E6S9VoSRnsrsB5BOMYNx+JsQgxED3ivGo0+A891FzvuCFzF24uATBJHPRmeqxUnXUL
 G1Qz+nsDPvrLgc5+boSsiBqnWRyHXFU/rkfohu04sGssKNDo4fve53AkJVwYXKwfi8GRQ+sR/3E
 pgq7O1wBf5yLe2KjS7w==
X-Proofpoint-GUID: QYHJ1ZINnYG5awd5iraZaCPM-YzNPVLg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX+ma4xDtIfuXv
 grEg85wHgWFaZs9Sp/aV6ifj3rFkrOJ/qjaHY9q88G3xMfUYYaRADwiTwgyyZ97MuLhqqnROqZV
 gCjh14wThmTWtllg276zYPkBTK201Hk=
X-Proofpoint-ORIG-GUID: QYHJ1ZINnYG5awd5iraZaCPM-YzNPVLg
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2ff49 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tb7J9fPpy6OZh8FWujQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100045



On 10-11-2026 14:58, Krzysztof Kozlowski wrote:
>> The Hawi platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
> Amount of dependencies here makes it not possible to apply and b4 diff.
> I don't even understand why PHY patches are dependencies for media ones,
> but if that's the case, then this must wait.

As mentioned in the cover letter, patches 2 and 4 are for the PHY maintainer,
while patches 3, 5 and 6 are for the media maintainer once reviewed.

The PHY and media parts are otherwise independent and can go through
their respective trees separately.

If this layout makes b4 review harder, I can split the next revision into
separate PHY and media series. Please let me know if you prefer that or 
existing layout.

-- 
Regards,
Nihal Kumar Gupta

