Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7D37C0E6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323470; cv=none; b=pzsrMX9JJWKdOgfK90kjGoeV25PLhz3ZUTZ+JrW05dfAtzpnF3KO+PLmUlg5eaBphUOdBpJS9lncnHy1o+8cS80PBkgFsdoIl51CjMicwm+TbokoIA0ilb9hCIIw6WPM+e6YU61oDo5hp7+Frnzbz+ULKZASlVOELwWRRZRBlx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323470; c=relaxed/simple;
	bh=JvWVPu6HU78CWF4y+nQbEPr+5n5FK2KXgTnzzkAAebA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvBeXlq8n9IUSb2FXt7yzaLl08MQuow1QReEp2q/7F/xidUG+33tFx5/WC5h2HaIUmNPlsUQY8/YgOYJWh9S75gR5sNMxOkSY5PpyJe/67y9MwwU/CWiwgS2LhyazXGOcGyCVNHmvdSblCBT5Ez2dJEKTK1+U1VWGpNU9Bb80Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9dpEhk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDJqkVfl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9dpEhk3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDJqkVfl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641V023623887
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Hbcu27UhhQ4jr4ufivOlKvSocOwA+H2JP4HM3wd8mI=; b=E9dpEhk3pI2YePaz
	i+v8fBH+ZFHrTI85qIgEufDX/XsJJZXabcjYPobJ5OfnHWj7ulfcyLi2tXpfGRtI
	8Coo6aXCsLBqnW2hDrzdVIaZvU6SRr4qHyJmlQ8XxHBUP/DgWybHTmQW/y/mRKnr
	EhZ7z2Y+MYmV64lbqjR6j2gjsp0HXFVuQfxXEnj+AqzN/aExzXuT7IMiIjb6/TVg
	jWi+qx/UBqKMW5Xa2UBOWeBI1w6H3mX9eRNPaPPjm+qJLgh0RlSOrN+d2NfcwqLe
	8/o9sV/RvCvu8poVcuZ8DXLTXo/r7HuvCOkS63x1Ag1v/5MuVVut/+dc8PQwL2G+
	PayT3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw725-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:37:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so457415585a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783323459; x=1783928259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Hbcu27UhhQ4jr4ufivOlKvSocOwA+H2JP4HM3wd8mI=;
        b=BDJqkVflOLCWSNaBtNDKV/SYK7tkIZopQGJw08VS37UXV2V8yLhZuxq/Qp1rYDAhgt
         IiXaacKgYZHANpL/QxQsdPmnKCtcdKXe14oNhLFOKJiN6ygf3M+bMNT3ki9Oi4vw5PID
         qKBaKxsLF0ix/DthJMZXZxkxFjUuhfKtovmv24n8O3nuWtkDBRdJ3OLRr/ae7sYxcFuJ
         VhtiQqshGz/7H0QwTKty/3Ybk7Z8abH1qIzmuYeacN0rgKjfWC/kfcy5L76zxphTDhG2
         gDx9Xm0/sfhRHkDLP6oUsPL7YrqMBl4a/+2Ic6tCNnnpu/A81yY/dsz7Fj4UEIwYdEIf
         qyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783323459; x=1783928259;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hbcu27UhhQ4jr4ufivOlKvSocOwA+H2JP4HM3wd8mI=;
        b=OOLWzS0f+N/qzr0vyycwX5dB4LQMSXYWTYCZ4l8+0FXnGLlZsKPNrZwyNaeycNuu5u
         Npf8Ep5f222/IxZ6Z1mzFK8L7DnPnxUik5NQ3Z+z+GiSqqz8sQ+QP9uj+pS4HQqnsJKg
         W2R7Ndt/R+K/T1opjrjIpblff+zVFXUy8xCbeus29T9g0VILwC01zCeY2dLIQMnTf8uE
         ULAAlgPg9lCXzwAAwgZJcIVqX4qs7KO9k/US1AbQjKQnoX8+1AVX0eZXXwaCJZnWPfmf
         1UKuh91mozrGk8w5Q2ns6jlk/WrA0Thf6Q5YgiNvW6gqRJffvH4kbxZ23u4RgJxlph1S
         1DPw==
X-Forwarded-Encrypted: i=1; AHgh+RoBuz+O8iibp6pM7MpwYsmAJGFenu065dsvtDAWthT5OCU8tjeKhABe3aFu5/naQAvHFhlNAjl9HNWE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54Bghlri0N9AhgIy6iPCvsjpbBO+5+vJe7Q/HkYT8eKmF1X04
	zBFeMRlxaY6jLErCrLgRghFBmqweW5EM/q8xxx9u0Kcb+7BV8TDfW481fh0oSEWwOzKR5MNZolL
	QbCv8JiyJBRy7qvzXtlv5HKaGWnweTS1XMNs/kS5bcstA0iqrGsFivn78uWlWURUC
X-Gm-Gg: AfdE7cl/VUqOC8ShWLDfpv/2MIdNaePhNDvkZV8aD1tRM6KiEYNfYSXD7CNrYk4SN5l
	LYTVga7VgCj+lR2YIMz6gGL2sJpFdKNgNHJy2f3Cr3ZqtOT0DrMoZqf9G7ertsiSInVHRrWTpO4
	NR1Fo6YPrQUTSw1QOeUx7uhRjIBrTa33yB1+f5ylb1JDNKuOr+K4SqERp2/6/o9oZvra+GYMyHQ
	TD/fayy3+1HQ6KmcGZSZB4rEbvPMaLeETSGVrpnZF1bsVLPPkUUhIzIkGzJHDDMGfM9CodOwU2B
	sGgt8DLV3hj4zRz+1tUXaLJL1CU3Fg8UqD9VFyGXDAVPu4NQ069ZZv8sivddTh960Z92IyRbkz0
	bbcRtLjiy62eabdbK/RrJZwPhipfLSKBaf6lHsA6Y
X-Received: by 2002:a05:620a:461f:b0:92b:6805:9188 with SMTP id af79cd13be357-92e9a51ad8fmr1276614085a.64.1783323457561;
        Mon, 06 Jul 2026 00:37:37 -0700 (PDT)
X-Received: by 2002:a05:620a:461f:b0:92b:6805:9188 with SMTP id af79cd13be357-92e9a51ad8fmr1276611785a.64.1783323456949;
        Mon, 06 Jul 2026 00:37:36 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm23308756f8f.21.2026.07.06.00.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:37:36 -0700 (PDT)
Message-ID: <e8085b6b-35de-4f93-ad76-158bedb6d585@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:37:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
 <DJRB0IFM6VRY.1H62MF66GWTN1@fairphone.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DJRB0IFM6VRY.1H62MF66GWTN1@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3NCBTYWx0ZWRfXyRBKSwDaRwC3
 l8MGodjdvZUPkuPOb1gJGStUC2Ku72NkMb3WnX04aDpnf6D1RiIWNJqtf+BNQa+RgQSrLpz7MU+
 RbLiGwuYGQw/MVAHTVdtIUNtF0eyIX0=
X-Proofpoint-ORIG-GUID: rOnYnE326_u_Vi7FcSRxyVQasjeLmvYe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3NCBTYWx0ZWRfX+sog9ppIyVfL
 STk8Nh1tW6AzjqBACz2G3vMOZDWLchRlsvYtZrhTUtBdmmmkF0qyujLQ5vzpd6f90H3Uy5vzak6
 rJsD76RQXcgAx8uBhz75O5Hf2AOemqatrzP1c/Wu6SnGZJLVcfaYMv3K9A+JMuNTYwKbsiiOWF7
 96/3KfsHscjMPA6EqHKYuH2vDJ4W7i2f2UY9tPXZntBDcZzCzWehjfAIgv3ZlYRyNBAxh/1RMhL
 PRhsJktdcyjaCOs5RLwZvYkZVwBiMxawnZtxN0siKLGCsewUJPrS3TXpt35x6cq6H6/6ThLTnTP
 aa1TbFYE1sM5DEUmwq4/HMFqObtqQe0cW72zHb8rZha3jvM990uxSNBKVXrjWE7xBxq6W0hrQSn
 y8AYtXovV7f6cpQvOnm+6SA6L8SIXbpE2ZlyEWuIgO+BCzUm9h4SsDJlA/nSFEDydvNFFUOjhth
 BpE830YclXIM7GupiOg==
X-Proofpoint-GUID: rOnYnE326_u_Vi7FcSRxyVQasjeLmvYe
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b5b44 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-8dpHqOT-xW3OEjmEsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060074

On 06/07/2026 09:19, Luca Weiss wrote:
> On Mon Jul 6, 2026 at 9:03 AM CEST, Krzysztof Kozlowski wrote:
>> DTS coding style prefers hyphens instead of underscores in the node
>> names.  Change should be safe, because node names are not considered an
>> ABI.
> 
> Until Qualcomm decides they are ABI :(

If such node-name-ABI ever comes from Qualcomm, I will NAK :)

Sashiko also pointed out the error and I will be sending v2.

I will introduce shellcheck-style exceptions for warnings to the
checker. But first let's fix all the warnings :)

Best regards,
Krzysztof
