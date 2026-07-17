Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6C030EF63
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273779; cv=none; b=KwcwfzZ3Nyu1fx0o5Gqhw6R6BT1QglqKnYWaFqnc61ManTMZGNkIlXYU1juJ1BRwZFvNrLZCBOcz3OmuEYTl0CdQeuXHASFNZ8fP941m9hPcx1WZXoUA8oKgsnRMdqXsW1+qQxklgNPPVWNa1FkvSAhl5W6kMOgAysAqTLVz/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273779; c=relaxed/simple;
	bh=IZDUbHKMIMWw9GZtaaY622c0BCnjWRTff5OD6XNIH7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJsEXKfl9vXu2u06H70d7iSMp9Ca6l+HWZhgMO1sPG9d/5wVrtQVCuKNtNjJBtGWACvbA6WbiO4JeNytiipnhTwhVuv9l5PKdaCDiwjCV9v3zSUVKhISgng2pSMlfBUcFCMlY6JQKEsDxdnEWDYt56ex6Jgiqk+pJhIZcfBrBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImE9L04U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsMriSrs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImE9L04U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsMriSrs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cIp12098571
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NW6RQI9UDAbY0cyHYYXMDr9odRZDv+nXa8Wh08S2C18=; b=ImE9L04UB6ab49sw
	YQG1ulxC96csZhTtpQEohtd3wSouduH1b8jNE8rMbG+hgKwlT/CWQ5X5lHibhUbD
	EBT/eokG4UT1/IuItzCC55oOHty/cRd1pci8+5o8u3pnBiEdr5DcCAjUAabHXoo1
	VEH4a12B7e7YumEhocIpXu4X1aQgdGvgCM/oAfSvpv476bKhU7LDvJ25CbAf+HvO
	tU5PsJ/zrhTL4IU2TE2b/okXswxljQLMNTTWMLOrWKnBWjkASNKJ6q7qWFzgp0An
	1DbX3v/oRjcRsNWRYE0/ipJG483M2yhwrN2g7N0bAE2q/9H+znhNqZyS8fp81I3J
	htyk9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jkpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:36:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca5d2474c7so109958065ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273777; x=1784878577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NW6RQI9UDAbY0cyHYYXMDr9odRZDv+nXa8Wh08S2C18=;
        b=UsMriSrsIkhJ3nx+MRPsFKfroNBujlP3nwdPFWDRMOZiqMmbtDD5DucrHOPJabywt/
         fsYNfe7AA/dt7b6cN2MMpfJ+X2zQ+xHz+m+8BWbY0SanmpI4VaUaJsqwuQfAAYEeqSSy
         njgraTvL82+z4Zubkh1cc3mowa/8lPT5nxhULeZXpXyg2nCWtzQvlh4uwft0S/WEKvDg
         6reS7WpTGbo/tmBRTh9RcGBWZN5NuOt1Z0j05bvP6pdSb3J8qJ4AVgc7QSoqybIROAWs
         ZtF3oq6n/1pdJvFdknk+czTrJdg1L6SgaJp+qFOtWfNpTl+bL803noEZT8YGD3Im8Ij+
         i1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273777; x=1784878577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NW6RQI9UDAbY0cyHYYXMDr9odRZDv+nXa8Wh08S2C18=;
        b=SJukRkApE8O672W4xTfcyWKbfSy1P8tSpA+WMMVlH6WT/qKQStHAxG3Vh0aGj+UDo9
         WvM3PbxTL2+x/A4SSsaSXX3sGKtfEDbTP+Oebf6lmc97fss4eStT/ubcrG9ij+U7E4Ty
         8aDx6AKCw2P53TTpMfFo59mnmU/KM0NY195EuRxdVM9fqIkH+mvHeJy8ECx16JGQV6gS
         oQJjePh9OtOCp7jDJXkl1uJ33Io56hbPTqwuEjWKnyLRm/+Y+blBHsl9HaL8pYmLvolK
         r4+r32KvWKu0anJUFewr73uEL3NYUz6lc45X3jel4xBXkBHzwDOD+y7Vxs/XCoRks+Ri
         el9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpz7NziUoStolQZLaEYIiwclwgHavdJTR22Xoa/FCExlTJ9kO6kX2eB+qnO2rIh62noTwQsycqVfW3C@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi6wHtW0uBfBG74U+Q4FIyevNXs84db38EGXEv5Di8W55cn59D
	mMXsLK/2CjzfX9mv96nGgL2sV4CyH3F5CthIBCBPKb1vWr6p72GLSOYYwMoV7HNJp4mDQKFpdjT
	1ZqC8wNRbNAPBX2BizVSLt+0bizCO9ap+6oIngXLag2u9xSqN08fiFdcUw/MGnL84
X-Gm-Gg: AfdE7cnyvL3s9nqbPilZjNWgDpdZUhaXdfQD/1z9BMLnHHpyjxn4G+EMmytrSIIBQaz
	+LA5+SaC/YuoKwdt3n/49e7t0LP8zdmL73VlEj8wqkevr9PMRiJbrXOrqUDy9Dm5UYz3awl8XZV
	jnNfAWeNHkXyeEo28kBW11Nyg4OVVVP+0LSQ4vlqoylRgpxN6P9bVghv50FOwF72wJrE52QvYLw
	n5F7nf/C9+FX7Nq5JC0Cz+lkk76pSyFM8P2qjy3gBQI9kp1IY3NrUKXHqisJuUh665oPFx0r1XH
	46nBH1qcwHLrNAs85R13fTc9ie6nBQTcXG4sECDKzbhAhnQ0zYBCmxZHPAZ/1zW0U9i079puuqQ
	d7LGRKvjFwHOnQFyqV3/hJahrjEmfCSLUz5CZK9WAWkSjYgw5eJfu1UqsIVbCCpFo8+gi
X-Received: by 2002:a17:902:f705:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cf3494f91fmr14982305ad.24.1784273776906;
        Fri, 17 Jul 2026 00:36:16 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cf3494f91fmr14982015ad.24.1784273776361;
        Fri, 17 Jul 2026 00:36:16 -0700 (PDT)
Received: from [10.133.33.92] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm5823275ad.52.2026.07.17.00.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 00:36:16 -0700 (PDT)
Message-ID: <ce87b217-778c-4a14-a5c9-d28f927f099b@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:36:11 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and
 Maili MPSS compatible
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfX+/ZagErBOuyy
 Sw035gBm842fo/WJApLZ5z0fKCm0ehXtKf8YLm4pcW7DtU6RXKHPOsYOvHCzo8R6zcz3NmZTGPS
 gBakoDi7nM4JkWGfKK7rNcj4jmDwQVjS9/3EWlo3r12JetMMjtRQZOSa/nhY3EVO+TylS5XNdI5
 ycMrVWUZtMYWqFUy0/4DlrxYF57MuQMUDtvh1MShQLWzhSQGOVlg1h6UdnugdKH31xN8NgmOu9q
 t+2US9ylMzlr5zLOlW7EZRmPT2eGaxUtc/yEWDStQUCzvg5Ow6os1NDD4Btt9WSejbX8aOcHHtl
 1flltsjYv8FLSKOkLavnhY1Bw/2EPdGzp+TkYfVkwQARyPcFzb6XH2F8c3eVVO6rQWgOXJpMBH6
 jIWiB2OJYdKm7hi4OiS9hcBlO0uhbeWUTD3oBBM6xWNtEVdBO+4yr9DhXvfuIJ8JSfMV/FcCtc0
 rK9qILPTYujUxnNkVnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfX2Magw6b5YjcY
 MoTQiG1CR+/ZOG/3REYioyfavTfZc56Zh2YM00vRZvkLeO2kRgo9SXvawDLTUd/MiOS5Ar7thWq
 TZKkM/+Ib4yuEHN5UU8QoGTrSNT30YA=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59db71 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=O2hqE-0K3YR9ZxWvhRwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: EGiSh1dqQssJsGbm6MQMwrZuWGiQ9xSE
X-Proofpoint-ORIG-GUID: EGiSh1dqQssJsGbm6MQMwrZuWGiQ9xSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170074



On 7/13/2026 5:32 PM, Mukesh Ojha wrote:
> Document compatible string for the MPSS Peripheral Authentication
> Service on the Hawi and Maili SoCs. The Hawi and Maili MPSS is
> compatible with the SM8650 MPSS (six interrupts, CX and MSS power
> domains, memory region).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index faf7b2890de8..0d9fd1598b5b 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -17,6 +17,8 @@ properties:
>     compatible:
>       oneOf:
>         - enum:
> +          - qcom,hawi-mpss-pas
> +          - qcom,maili-mpss-pas
>             - qcom,sdx75-mpss-pas
>             - qcom,sm8550-adsp-pas
>             - qcom,sm8550-cdsp-pas
> @@ -196,6 +198,8 @@ allOf:
>         properties:
>           compatible:
>             enum:
> +            - qcom,hawi-mpss-pas
> +            - qcom,maili-mpss-pas
>               - qcom,sdx75-mpss-pas
>               - qcom,sm8650-mpss-pas
>       then:
> @@ -246,6 +250,8 @@ allOf:
>         properties:
>           compatible:
>             enum:
> +            - qcom,hawi-mpss-pas
> +            - qcom,maili-mpss-pas
>               - qcom,sdx75-mpss-pas
>               - qcom,sm8550-mpss-pas
>               - qcom,sm8650-mpss-pas

IMO, both should fall back to sm8650.


-- 
Best Regards,
Yijie

