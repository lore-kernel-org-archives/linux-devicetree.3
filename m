Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A03AB271
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122906; cv=none; b=T2OuwZgTTf2+C2yiX9aIYeJYhRPzSGcosYEN14KGzGkAq6aBThndkTTrZ7Z/bx8sxDUxEMAnL/EafxQf1B4NHq0nYxLQPpB386GmheP+fqod8AqkrPRv2Q31eDlHd1VVIqPLvWWJNIiDhcKEY5H7eVCLSsQOdOABWIfc25rPAQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122906; c=relaxed/simple;
	bh=wqef/i8CLgqpwa1HZjZxRT8qtyeeU5odGIOCDmUuYas=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=dhzEhmgqQQA+RZwcQtzxq7MI8DQvaPA60a+gqzGxYy2rjob30DvWhKAOlWv+rqQ5ECLYRMmxGjQoBNq+88Km5PetI06tx7dXHS+RZjj/TE3MktjUkDvW352QGqIg6sa4HnHn8NtOnW8zWGlgQfiQx/Db0XkpDmEC83zgiTGiD1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE26Iqor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQlIhVFA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE26Iqor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQlIhVFA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326ok643044199
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owvrumwMjhMv7jodBlueriw46OQ1H7TaSQot+pwnzS0=; b=CE26IqorYCBNImxV
	b3izoa6DMmw/DRpubTdORsyHXM9bFv2x3kgdtdo1a246Nk8+SroTiM3zYWwiswo+
	J9/+Ym2w6+O4bfhb8Y+mMw5iWl7gH2o0R41juF0RqKlKQbxLDWHZmQOs/NNM3b6v
	n2VyEwCzQNLtBISo7WKexvK+Gw6TAGXKx45e0IkhNWbTfErmAX0rZPFyEe1GaDD6
	3wfxoyVXL3G+J6LfsE0ruZafK0QkI63ueBZiQ5jfbckuA724KLaRLoBLBqTizOS1
	SixMka/IRZq1WREc95u6pao8yoWYXKQq0leA4xCP1rW0Al3sU+rPWgU00YHpvEzm
	tXIAKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v7da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:41:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b23af7d7e8so20128515ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122897; x=1775727697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owvrumwMjhMv7jodBlueriw46OQ1H7TaSQot+pwnzS0=;
        b=iQlIhVFAWhA6gi14iOhi44c6uW2evTKHLYxmQElAtLkUFx+a7Oyo8YonSmkKeNQudq
         AN5BKUQp+RcpwY9Hq5XwrLjPUciOohlQlJU9Bzg10hYW65nJJ78AF0lYp7Dpx1Xv+kSy
         lUR2kJfIhHswwok5f372vyrFvWXzt0EQt0bxnMoXYDAWiqLfuGCuEMOx+ySeNXzkyocd
         nXBpOqvlABchoJep73e78wEdRC2z+OHviEAs5IkSf63KXU1yTiB0/Zrmi4G3FR68otfj
         dAxLIhlyinX+vGDdzB2AWpwNeuKI62MIHk5UQbs+H9uLXB5ylfrjwRTQ99kr31Ter5Bb
         YPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122897; x=1775727697;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owvrumwMjhMv7jodBlueriw46OQ1H7TaSQot+pwnzS0=;
        b=e6Haocvxlh1FkHb5cNjWs3hc57O0RtDHud4VFfde+oIvu7h7/rKScJNNPvfmGgh4Nf
         akFJPT14acXadz7Nqt1nlj+exxChBwX+og2Benb7FwM1QhvV3tgB/8z5FldPVqbgqG1I
         Dxxtf9IHEy6HZ5w72Xsm+sxAvQRL0k/jwdcsmKFl+NrspRkTUyezkgeokHUT1xS9lKAL
         gDBEsdyy59cCiGNTkKLZjjBzC/OpHRPsXamPRIMPmliKrhzl3ch9A2XEiWh6KRouXHiq
         EC585ffWgPOY4f1DilmyOVpim1zjU8zUEdE8rOIPrUaTB6S37CJAJ7yVc7RvNNDrFAeN
         GJnA==
X-Forwarded-Encrypted: i=1; AJvYcCVLymACg0CBhxUvihWyftVkFnuuchfESrwwK54egL8L/fdD7jOdNIoURbJNcZer9v1sYeljcy3Oexi7@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxsxja1mDupdSeXArwbbg0LIz302XWBNLrA0ruFa195Rkuy5i
	aKedPgo7c0NJqMrzS0xyQA+lcAg6CxxIGl7oMse45ll4qNNCeyFyt/L+qVEQJknt4PYeo4OGl9R
	gjcFu2wlgt2Zob9OJIxLncGAn7tj6ziOEgJT/Msko+P+fu/4fu+OBtHQbW3aFpwSg
X-Gm-Gg: AeBDiesLLssZQUDUgr8gSJtSf73FFNdmPHyu+S3S257Bx8Ni/emBIoqwelnIeNiszNj
	s83tDWhFMKNFxIp11UDdFz5g6VnTGeunJXDe8x+S4rNZ8EdEV9LvFHFcRIJtDR5Mtmi8Lskl1xc
	L7h2sLQ7M561G1RsVAvL0w0f3mCm2ZHs62SH6DLkmef6IhKHw++9+DhhNgarpkon/LFmRrKC5Yy
	L9BVgtpcL7yrXOE1nrL2j0DAuIeE4xl5nTbNYfoYtpoP/VYDwXrrJ1n2/oFz4xQxMGxy31kUhMW
	hmHkPuimec5Pni2W8AP41gq/zQoympVN5sbuGypCtbRot9pUpwazfZ4MEPA2EiWutoRSxniPkcX
	ti3yEwPbbuCaAh/Fo0iCplVs3tzIcwH68i+Gmp7nJ5KiF0dwEFA1E6POulX5Tfm6Zdwmm/6rSvn
	t7j5JT+Slksh9Bb8w=
X-Received: by 2002:a17:902:cccd:b0:2b2:67cd:9963 with SMTP id d9443c01a7336-2b275d7c6e0mr27390225ad.38.1775122896802;
        Thu, 02 Apr 2026 02:41:36 -0700 (PDT)
X-Received: by 2002:a17:902:cccd:b0:2b2:67cd:9963 with SMTP id d9443c01a7336-2b275d7c6e0mr27389975ad.38.1775122896351;
        Thu, 02 Apr 2026 02:41:36 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm24051245ad.53.2026.04.02.02.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:41:35 -0700 (PDT)
Message-ID: <f47a910d-874a-4594-a40d-f27a7166c6fb@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 17:41:11 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
 <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Language: en-US
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce39d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CY3x0PKZXqireWAYPuEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NiBTYWx0ZWRfX40KoQMtnYzAx
 fHTE8qvql1XNFGOjmH6Mu5F+FasrlkbZNTCACLNV6jhI6m/Y4hLBvB4pV06+IbfC5MshCbrcqQH
 NFiqiHmuvPWlBjZjubLWSqlHN0axbcX4SLxAzPr/rDSLMDp/uxZZVrtSRHsaEOsZz4tQjD2+ybJ
 Cc1XyNOLAGCc6RnJsMFphddKN3Ae/4uqz4P7fClHubWREPPo8YcD/FDvMr/XmGjbCj75ywDi8aF
 Q/BLjjY+hpqGyz6OxLRY4HvcoCDoIzqyNKYHxNPr9j4x9sUeuaxfLdLeZOikg7+9YG+UuatNkiA
 wE6X3imGFlCqGnrtA/Oe2ONkixtifGdeNF2mcL9FOU2+wQkJHh5GttncYnChODzRAvsycE8K82X
 VbuGwMJWaWoUtwYu9qUSjRQk+ECgsUqcj153YEJP2x7uPIcCS6XoLFBvfwRfyZzyBTMNPMRx1Dd
 zlhgIIMlxWMewprO+tQ==
X-Proofpoint-ORIG-GUID: VXrTNagbkhOfAkl48th5mNqpCF4N3SBK
X-Proofpoint-GUID: VXrTNagbkhOfAkl48th5mNqpCF4N3SBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020086


On 4/1/2026 7:33 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
>> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
>> compute clients open contexts concurrently, leading to -EBUSY failures.
>>
>> Describe the compute context bank with qcom,nsessions = <5> so the
>> driver can provision enough session slots for the compute-cb instance.
> This is a software property, so it probably should not have been added
> to the DT in the first place. Can we replace it with the driver code,
> allocating more sessions to the last CB?

Thank you for your suggestion. I will check the methods you mentioned.

Thanks,
Jianping.

>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 6079e67ea829..5bd20909f9db 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -4465,6 +4465,7 @@ compute-cb@5 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <5>;
>>   						iommus = <&apps_smmu 0x1805 0x0>;
>> +						qcom,nsessions = <5>;
>>   						dma-coherent;
>>   					};
>>   				};
>> -- 
>> 2.43.0
>>
