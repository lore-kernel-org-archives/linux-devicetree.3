Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4D380FDF
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076221; cv=none; b=hUG9VRJgLNLk1WCzy/ovDVgWLZuVR1ZngWFrZdrfuAdJBLzCrRX114U3CfoFFkVy7tecePFp0Yoaj6IKvxAS3CDmwIU1QnllEQ5F2nUPBCoxEXK9fx36G/ueHUPB5+IumLnadSKT1jgcn4FNAANAbbuJ1AT3nc4gffK5Bgn2vN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076221; c=relaxed/simple;
	bh=0JQacMzSRyjTQQBcAIZhimbdIEW+6BxXqyEMkbRDc5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cc7GfRWjrEqGlidKRbCBQO6CYAaAqWvjo9ukmFTcIOokYhkf40+EhvYYgQH4D0KZm4IUy1flgFequIBIHTVh5zNgX0VqBcjcOr06xyi8MhIRbPSGKPAULWG4eytXfRe8oip46IaHXf09MoSzYgyU6nd3r6ySpETxGMqevdUTdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ic03lH68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hpdsh+IQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ic03lH68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hpdsh+IQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635ritI3134744
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2RjymqnrnjnMkXGMrr1Wr7oxFtsD0iqenABKIn+vrg=; b=Ic03lH68RGmTLr/a
	ONrW36nAfNOdk9sQPBGHBYuNBWss7dPkk7gBHRpHagkt4cd3Ps7XMDx/EdNQGH6/
	lbiDwOiyhknrfWWMynvXpbqq0MH9LmRUeGlj0U3tkxLjZaKhXnRPezrzr6NWDjbD
	gvZ958EqQorc+LfqZFQWMzuvcN2rW875W6ol49u9YQQqcMD/awLrlFP95H/UTEFy
	4Fd3rzvuwj8oL3sx4hYSeqeuyMGYhKvVThNg8S3kqAObkknMyt0V0tQK9jEBfd8C
	6+3Bf3YEOnOv7+1mftUsVPtV9jU9ui2cqaQNIs45Bd04nuofzaqBDHIt0Hpbguxc
	wlznvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qchp98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:56:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e566bae1bso7763685a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783076219; x=1783681019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2RjymqnrnjnMkXGMrr1Wr7oxFtsD0iqenABKIn+vrg=;
        b=Hpdsh+IQhHlHT/Y9F36+KMpUQyS2R/GMLYdPgHdV46fQaywwt2+AfBAryVlUDpT95v
         50Zdy39TEYfk+i/CS/2Xd92z/SWqsBQSqhxwncONLoAB45Ir6rULOuVGA+7eKeUcHEaX
         vbYylOgxpa8OX9VDFp8GaEAju1q6hQmo7jeTm3TxXqDn99RLAbWvCXu1CwbBWse6rBPH
         T10ptOghH/giGQSkLGTODeUsk6fa/1ZrxF6SE4EGpQzWcgJHKJxzCNJqdvGeDs4l/iA2
         okJUtiebgAc6tfSluzrzFpdK69m6vvR7Hmh2Fzu2SqEIoFqxIaTRGKgtNlW/iujOtoON
         FPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076219; x=1783681019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2RjymqnrnjnMkXGMrr1Wr7oxFtsD0iqenABKIn+vrg=;
        b=Pqa1mM8qM00qsUOVhFhRKZRIuLI6u4iYZDlbgTF4ji6cOS00DbvF/+aPpsRLA8oFmj
         s0m0A7K+DJdrjOdsH4/KvmjNOsRmo3rVYprpiyQOy/mg8bhdWfq2aJ390CPf11+CCR9G
         KnAOZ77uvBzXfHJCCmVlEfrVzZTaVAKyv/pTWA5bSsVtFGyqnTS307ma3XTbwdgDDqRh
         HuvN2t73AK5oRWJucbiYMKn8VfRsCPlkOZesiiRbNTjwXKkEp/7uztPxRA9P1UOcwLp7
         StA8hX2Oe82usQco2YJ9G0gHp2Zpkr/BKPbdM4/UcReqw9BwDoutVm7zVSaHF7cFekXr
         HpQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CWQe7WHOEBdi99u1BqTNzKL4PTS9aQGPIQDTZpnK5LxwmiXCVLyl/kpy60Y2JjuU16x4BdWoNJzcx@vger.kernel.org
X-Gm-Message-State: AOJu0YzXJrRpDSX3YJPOnkQZyCGJbFayfTRMKpSHxd+O8OYaQbyy+2uC
	fscHsoh3Gf7RODP+JtmUQftqWtol0BxmbV0MHgDgWvva6jyu1vKENYgupcn5+NGCjiKyLIIYZ29
	mFVBGG2ntAXcxNWuRrkbxGND/ITgUm9hSlU8IzoyHtIhibjQ/0DTzHoWa/xaU0yDK
X-Gm-Gg: AfdE7ck/MRMbQAX3Eqh0Bwf3YGLHW7KfWF/aNx05Fxfo7a7GVnviAPwa0gtlWBSIcw4
	Ggra4SFulxtUkMXq/dXbI4u9EEIxDoHOptKgEoGUIvaYN8bRFVDfNS6bXraz2OpLGeQiZPF38mg
	NOUF9o2DNM9hEmdRd9YWjiiV4WFiNXhYQCkdbGtOWSsgiVV4WDogsTtflGQkB8dpllQ7fbIZG/K
	xeZV/FxIARx82PkO+4uKbifSkEemANJvHSGMnrffvIlV7jNQ6Wj7qDrN47/NPeVHDs6uXl2bgvr
	78GqCits3AJl3g7X6WJy7tJ/9w1mmfc1biy8f0OYQfF4ljMAIOAszi8pwqjH/yB4Wg+yIA4648Z
	W/sQtPWXudHHEu2ShAzNOxWpRyMT6XrkGwGw=
X-Received: by 2002:a05:620a:628a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92e781c5c78mr755176485a.2.1783076218976;
        Fri, 03 Jul 2026 03:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:628a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92e781c5c78mr755175285a.2.1783076218537;
        Fri, 03 Jul 2026 03:56:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm266011266b.44.2026.07.03.03.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:56:56 -0700 (PDT)
Message-ID: <67825b75-3632-42ac-be73-1712b3933791@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:56:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to
 usb controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G6OWYG1qNh8GZPJ4NzrN7LIixHP1PlFd
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47957b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=i8nJ_-aNT86P3f_d1rcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: G6OWYG1qNh8GZPJ4NzrN7LIixHP1PlFd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX3SL6F1aacQ+Z
 U0cWmryDSdbFQgt0fpfzM8SQSL28k8VIg6Ez1GT+lTPaTQuI5Y+Bsl0qviyfnpjNle7Ooin3K9D
 JAplaJqgWOIIpB0eZb7dAbD6YLA8hMpqguWBDKDmK5HIKsY603T56bldXEGkSUt96gSx0i3O012
 0PT7f8e8hbAC911m21BG5SCk5asVgWcQ770uLrSI1x5Od0HBIAn5li0nG6cCjd9V47O+nMPBc5L
 YyYbnMaUu0tYTMBATljGPv7/bMWlKvfzH3J4IXd2GuxoCk+9kCGJATgDb9Zjh+oln1hisC312rp
 OQ+nYv2bHMAlx3UfQE7lWRwn7B8ZXjrtUdw50sqQ0uaGMvOPioXVWp2gorGlg3ulhT1VulESJDi
 9QBe8Vu+Vt4YWLgZW/Hhd5SOPq7M2RcazxZtzpz2scE8ekotl0tQeXnkSBz4n86Qv5pVWyzrUU+
 VhX5HmT4RKPud1b1l7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX9gFvpw7wGW19
 JQf3HdtpcmS6STG1JGNMEab2kkz22vXgxsBPXpTfDU6NSBQfYpQ/NbwvdCSG3l5/dUurnglwdOh
 RXh4TQpaZ2Y604cOhFY9OZXZ69iubVY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030105

On 7/2/26 8:45 PM, Krishna Kurapati wrote:
> USB controller on SM8750 can be configured as a wakeup capable device.
> Add wakeup-source property indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
