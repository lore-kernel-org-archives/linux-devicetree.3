Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF463B47CA
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072689; cv=none; b=r7vpeRDGNSB2KNlCPJHS47ZgaMKZSxa8RVDkkLZ1vqqcq+P7NqPwYFPWmFkSweaNjWHLixWRu4QCZq9tx71ruxW9itFhz82j6pJSuqvBGNVpEq9uQxIFrWf1ki7Zq7WkIS1PPsin1h/JcgqmmuHC7j2qNB4IOf8V+XwUYe9tXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072689; c=relaxed/simple;
	bh=dPkh1InzqabcTA5ZvuUUGhToK0ol/DS7YN924PwmzBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+2tXqDEQZzxABdpmxaClnaTWSrW3JKTe4b9E+S/e2g99Fya1Wn2Ry/3kZRaTeAAcgqMB42i6fsqg7im/GFIFZPyJ0pUX+tUsnGlRQSiSZTsA0bA3JNZt3naBV7/0OkeARukW6+I7c5FETY2DN9sR0IYJuEMp1Wyg9nnqXkanWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkSfgyDB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byFAivKk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkSfgyDB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byFAivKk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636hB6W3144370
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoYKLuGi04jdgLbN3bsgI7YhayAL/qiodIEudy/FMaQ=; b=HkSfgyDBsG1CNfwT
	Krpw34sOilVr1bN21HdFhfBDJlzPAX7Yf785UrcifX6yRQZFv8Z5uYS9UsrZ5nL9
	GRz8BbwWXtwvhUOgAb/Yr6yDgGZw1AZeeTONNKkE5UH+v/Ippp8OJK9lvbuAyOp1
	gDvYHgC0NnvK0PiOXBPNeg2sYS/o53o7c/Mgmanx+uVeo1t+zSjvGq2R1e8THAEQ
	/D4t6ATZl2TuFpBm6gbwjORt7gFLdEWPXOL+ORXH87zX7Oi7kf2ZiWk3PbMF8i5N
	Ckp3jbAQVG2q1JZsBwBO3K4IqMbDFG3++wJeSvITQ3lkAb4ifxY3FJveHM0SkiEj
	JtiX8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682brq5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:58:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so2811261cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783072684; x=1783677484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoYKLuGi04jdgLbN3bsgI7YhayAL/qiodIEudy/FMaQ=;
        b=byFAivKk9tZ2cDMaMMzyxAObZmX1OKNB6MTsNMiSOQHChjn7Ivpy17dAR9KgEAj59g
         gtX3SzVQ/u8YIQD+s1lESxKoPgXk4RLobpBorihcFzanrsy0j+wxkwfvZitG29mwD8pG
         QxNHRi6xrN6JdlKNGi7PutlxoUjmw5d3SpDgvPQFep3bs02JICa0gOIpzDUJNdgYORiC
         1OcVdB5fiX04qqwHwOR2plDSlYXMGEIGc8cCU0NDAssIlSPHcmSu3xVbx2rFjTZDUq5E
         Nl2AqYDFoTNDg2xG8WKtoKaARyL2IczWEE+MMMzmnYzQ3aq6BtecD4eoKkue4HSpv+pu
         nQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072684; x=1783677484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoYKLuGi04jdgLbN3bsgI7YhayAL/qiodIEudy/FMaQ=;
        b=QzTdjiHlxa237z94iVuFnwA8qvMzqnSTPr3P49sFhlt9jP2t3aqsmMYY0OxyoVQ3w7
         uah0avd3nDJP0J3jUT/mdKb1wAPlhhlmuLF5710HLFHd2BGoTN/0aSP+qfvRninqdRjZ
         X0CbxJNKlY5aOTb9Zk4rxPtDX8rZcJGaBNCzhuXPXIfchPSwF7vBl0+gnENw2+rBAsti
         TiYCwpjKDocYSZ7RWArIfX92Jj+7IgH2FjzJ03UOCVsFaWWs3/29TSqBtynJRcLuz/oD
         ipvkOUR7SgwZbPbY60hSVzi16zKz2hTUf9RRXh6zixNLcbEI/IFcr7yqfJSrOsdkvLqX
         rCWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGWJx+JmrBOckUDSNd15U8CQBfP7q2WacXNauXw3amFDLT+UDgkKUoeiPA+WMo7xkjSTNcJ/w+YuTS@vger.kernel.org
X-Gm-Message-State: AOJu0YyqL+vfGHdGaVQAioWZ09/BwC5ah7LiXqReWUy/Q37MUc7bA+db
	4QB2xdVAeZ9OVDRQwzLLnm34W+AOJt4MnI4ySWUM1/Mi9RLRa129uc+52sXqtDz0WoOFGg+3QIB
	9pllWNJNrcXLETACKOYOSm5iJxAtmsWxNdu+OtKh8cJlF4utJTrLLYpB+IQDPCZ/v
X-Gm-Gg: AfdE7ck+QsIXHNjoCMrgcV3K4jIsudhIIRtslN8wsnz8RP5b9GJuyb0MHlFFoKGMXc5
	Ip2XTjCkcTko4jryR+c4z22QSkYDBTVYnk8tlb2mFjKy9QI7L9cGnul6UVc00Bfoa/Dqr1x3wos
	r2LNzaO+6OWvAeWAs2Q9HmuSFfNgD5g/6KZYKTtkT+twxnyYqf+cxVqUgJIpy6uvBimvr05VYke
	TphR/pCbvnRiv8oJ4B6orfMsBM0+vOzTju+8yma2/AmO+nJPy5hRRZNw5g5zQf0JBCyM/k97JIY
	KDEUbK9uTSnTKEGnSxThH+f40Tcynxcw0MbTXAjnx4xFekvTbWoxKPAia7NDzSFoOitq2fmannC
	EwQraGjK2lQysXgCJVvDrjmgRWbbUHkovxLw=
X-Received: by 2002:a05:6214:808e:b0:8e9:f62b:8f96 with SMTP id 6a1803df08f44-8f3c9ac0d57mr76961886d6.11.1783072684504;
        Fri, 03 Jul 2026 02:58:04 -0700 (PDT)
X-Received: by 2002:a05:6214:808e:b0:8e9:f62b:8f96 with SMTP id 6a1803df08f44-8f3c9ac0d57mr76961656d6.11.1783072684112;
        Fri, 03 Jul 2026 02:58:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad100004sm2200209a12.18.2026.07.03.02.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:58:03 -0700 (PDT)
Message-ID: <156897ce-8a09-4b80-972d-95cd3b651540@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:58:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-3-449a402673d0@oss.qualcomm.com>
 <cfb45d95-7bf1-47dc-96f2-2ea4e9be9e70@kernel.org>
 <580d67aa-9a5f-4fd0-ad15-f57865b79477@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <580d67aa-9a5f-4fd0-ad15-f57865b79477@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX4nmrwVvD9Go+
 14ytGBjNoajy66nJnrWwDCSD4oxzeDSS8TrRVqYKURH/fC+3YuIQGPAqj0OIccLXvMNk4KyyzpT
 nSAzDseI5Grq3PRLHARAiN4nrUVKVAxap+aIdyVRzxX5PhtMVy/cg1aoa9Q1Pz+3ih0sQvQtHIS
 SqkQEoUq7vCQYKTfwwy7WJ45lKgeGqv+LWn0mKLP2LaDKpmWPjrDm4O0vgE2euqn2Q+n6xudQ2B
 yLa1IZVvszf8vkheGW7HCeXx8Yl6gXMhalXUK5J5uitSZRMcOvj46eALthaAFL/giVD+j5urRYU
 7gEkRI7czv1zwCipWfVuGWoU3lc1XOtUnVNfD8nJbiBXPU8G1VGmwFrO4L6mx1O7hlWWU5ALO+Y
 BpXQKbex1Ta8e8ahmNn/Ko5B6D/5pW6qE/SGHZ47W9KEh8afrGe1IY+mbx17ZJNryfIKerr5FBo
 KQ2Wpv5Td+a6t+j81ZA==
X-Proofpoint-ORIG-GUID: qddjSAo1HmPQ_dwTGNxzubiaR4kUZM5O
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4787ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IlD_5Ku2DeKw3NJ58Z4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX3BPyz95ULpwN
 a7AziWdaabKzATe6BonPe14H7H/DTjWWOKkRATsYitmMw4sGqalFe4ROVyOT3aw6wbHDw8CBAk5
 FbIdOYLHcdgubHaMIzLUN9Hq8tex1V0=
X-Proofpoint-GUID: qddjSAo1HmPQ_dwTGNxzubiaR4kUZM5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030096

On 7/3/26 11:10 AM, Nabige Aala wrote:
> 
> On 6/28/2026 2:14 PM, Krzysztof Kozlowski wrote:
>> On 27/06/2026 12:01, Nabige Aala wrote:
>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>
>>> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
>>> used on the Shikra board.
>> So that's a v4, no changelog, tags ignored, comments not responded and
>> also ignored.
>>
>> You got yourself one NAK, now second:
>>
>> NAK
>>
>> Address the comments before you send the next version.
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof,
> 
> 
> Regarding your initial comment "Does Samsung Shikra CQM EVK have it? I guess no."
> I checked internally and found that there is no Samsung specific Shikra board. Shikra (CQS and CQM) boards have this panel and i am upstreaming for the same boards.
> 
> I hope this clarifies the concern. Please let me know if you have any further questions.

Krzysztof wants you to refer to the board by its full name - "Qualcomm
Shikra EVK" or something like that, because you're submitting a patch
to an external subsystem where no one knows what 'shikra' refers to

Konrad
