Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB283E0251
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896981; cv=none; b=Lu+i1MRTWSA29G3ZaeO613FBOCeKll93ez/9cugFNZIWJFCY+uLX/JCecLacR/uhMaHNSiIJE+/kY3vfb/tP6G2bDdcU9Sady6+bN3LAN6ly5iX1DxmBnXa9ni2vVEvo6P8Xb8EHCB7QD+lnc+qAqGXG4Qzpkeu02d7zCaxOSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896981; c=relaxed/simple;
	bh=yHWPRys3U05z1+fNskLwUYRnO/48PBX/IFQ3Wl8KjH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHdYZyRb4fxbVEi+XFVH+Jopp46Z6SiX4u3BYIA6/hr3KUH5iRJH3lzkFT8iGuvkaxqE52O/3HRM8o04yDXLL/VSWwlKp2A9IDbIFmtaazAiMo16uQi+zIqoPCgtRGL82uDy8S/6c5H8pXtYbSE1SvESL/hVB4eZ76RW39s6Ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhZAWK6c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icVUEc1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhZAWK6c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icVUEc1M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UG4Aai3668609
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=; b=HhZAWK6cv0Nyn4LX
	LSK7kHxe7ovkOblAPIFEJ3oO2/IKSgW4CXLQfixlc3P1m3tzX6yNVSCSRe0lk/A1
	btd9VNQQgo+Ta6wfeeAtg2jBwCXaB8vzB7UZgOHtf8tKI4EyBekr2Fi0BPr2WLkJ
	XqAi0Yu8asfUbIhdY/H1KP087hIq0l29+Otv/5PlW0SvYLtDZBlUR+9DUFIpbl8b
	CmkMvz9KpgjaeSGvHDikq3KvyTIIKnVDlzJXEJSIXf1qO7jcjioB500reJVLu6uy
	8XM21xtmO5h/f/qnRx4qTYsGIzsgZzlk/NrqwOUHoDix+Mx4u/e4xMrN7Fi931BH
	zAP3Cw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7vcc0nnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:56:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127133794b6so4703260c88.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896979; x=1775501779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=;
        b=icVUEc1MD9HW3VA7lAtOhYVkIR/J2Hcge7yCoTeiarhKrhaB+jc4x9eRTztcQPhtiF
         KUKo8PXW2u62vzOVXohDENvphiBX7zLNZmo/K4nse8QSwA4xESntn2BX25BmdWSGqj2f
         tRcvYhQ+UgA05YMlknbCs42Fbvhmpuu+1NDwc4qAAB+cr/aYuy7Z8dbPAQyRnhdFmt+M
         wDfxppSRXlnrJ/pg8I7Ioa3G55cQfQF0Iqg0XM0Lr2A5gkPhIWnyjQf6YqaIaE2TXnXb
         YCIBQwb8C7MADq43vXoX4ooaCidU1y/yDjceLGAeC3tKbTk5sXsSuVrowkIVgU8MdhVQ
         Akow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896979; x=1775501779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=;
        b=bHDro9zkOpKy5fWaiLTSrY06G+DgmUlEb+Ar9KcTUOXL3z7L9ObLL6w9vKU1h4tgkr
         GvNiiVMEKItSy0WrCYzD3ekYY577F9i/ts7SuZ9/n5qOB/pidN3DD8afL7JUuPnPI7cd
         f/8w7okvuZTnwUgKUHQTQEf6KxQgKF7hV0NLyLMuSD4bQwriv5nSuWUJvuV3EoOkk8y4
         k/txxLJ72aMDX1H25f6VZmN37/HCu89GrrggUA7TfSPkTmepVVvMRvXFWFsrdEOb7pDI
         PAhZXZ5hfUmKBThSLtL23/kdxFBSxz+PvlJOdx1JjuFnPn3Z7Fz+pCBwSJsWFxcfZmwe
         fwnw==
X-Forwarded-Encrypted: i=1; AJvYcCW5EoBjUKszzlae/UMc0bpc0OGlzapd0gQffWv/tYow+atD9kSe1BhPMxrALnqz30iCDB/cmLRDlMqv@vger.kernel.org
X-Gm-Message-State: AOJu0YzgwDF2Dtubqym5MoJOdRqlZuwtZCjCu4CSMqrXBLwZ9nWBZEC+
	GR7NGRwhc3YCEUZgya/SAiyF6jjeqXqijrx2CV9hwT32HH+9oJuVyQd+IqBB5iTMIanX5w9gLWP
	SjF5nVj6PfDhMKgxVEbwhKf7AkgZRd/pyBycShg4qOEAsPelCZNGaCfNtxREOuQGKT7zALNyu
X-Gm-Gg: ATEYQzzTmkFpf1eHKp+EsT1tMZ7KWCLgI31n6CzTZWhR59G0cXAVVH7hJWuC1XeTZLx
	OZ6MAENwxyx6JTz5BrJu1x/QQ3Ho+6NnIRVHmVtlxJjx4oTbFtzAm2Mw8mEljcOOF5+16MNRmLy
	rJ/oltARbkkofq84yH7QblyesaD68SEbfnLFSgkKdj/SmhQZnkTKGMYR9YVwzuvfaPmg2bVCQhC
	ghS313in/cIk5fCUetFYpsbCg68A43+4MDBhPhfLhRVWW/BIIqKaRINGuENNsw29Fghd3EEjPwX
	8uYxeZWyuHsdWaXYsNwzo3ZaNfGr9HArusHvSiaAy9ZYLHrbC8fBHncIdzv0EMUK5rWU8QO2SZO
	TN+qCSqckdYYIqwoCkdnedRsb7GGqN2dCkku+RCROJbHdii9ekk7rEkjUqHG61b05mzkbiJOgx6
	SVQfhiz/w4T01kNA==
X-Received: by 2002:a05:7022:6281:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-12ab2857c82mr7701508c88.6.1774896979031;
        Mon, 30 Mar 2026 11:56:19 -0700 (PDT)
X-Received: by 2002:a05:7022:6281:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-12ab2857c82mr7701468c88.6.1774896978404;
        Mon, 30 Mar 2026 11:56:18 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac4a0fa8dsm4890474c88.15.2026.03.30.11.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:56:17 -0700 (PDT)
Message-ID: <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:56:16 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir
 <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
 <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P5AYGUpxQckX-1gHRPvLBDvD54iBj9PG
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=69cac754 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qpm92PVjyM3Q2z6jdXUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P5AYGUpxQckX-1gHRPvLBDvD54iBj9PG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfXya/B8ZY/LNN2
 wp6/ZTiE38Oq4UfeKZSBrU6lur2dCk96Tr2l2WvADWUPcF/aGUNm+Hhg78s7hSzrjKZE3c6SdVm
 jRSNe8OLeyXDlM5dKnBQPojXbJ/ncCxMudeS3eh2t6ku5WatmA+lAVXUkbKYeGM+hBL6HV+y7lN
 2jEQkR6jrnzYA6wG8VYG48rjSNGIbl670OSRs3nG0Ck7/O3ZPx1EzULgmjzWdbNCc0FuNyX3wW4
 qrrOl7WzR7s2m+ytra5JN33mglNtOQIiSbfQTw8F7p6Du+lUcJhDd15NHPG47nXzFwwFEq70gFi
 I551t8XcKXM46Dm8wdmimBBtDoIS1S2u8HJT5rvdu+lWkt+6b2bG24Bponn9uPhyBCAWIZCylS2
 OAMs4LSJfc2bbvh2dy0MeoM5QlV3ezD3iptLUHQjxUMYcveeqWOvSi0Jkjtnf0h+QKHQgDPhsra
 vI/Kzq/4Ok1yii4oySg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158

On 3/29/2026 9:26 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
>> From: Amit Pundir <amit.pundir@linaro.org>
>>
>> Some firmware versions do not support the host capability QMI request.
>> Since this request occurs before firmware-N.bin and board-M.bin are
>> loaded, the quirk cannot be expressed in the firmware itself.
> 
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Jeff, to my knowledge this is the best approach that we have to solve
> the issue on those devices.

I'm ok with this approach.

I need DT Review or ACK on the 1/3 patch in order to bring the first 2 patches
through my ath tree.

/jeff
