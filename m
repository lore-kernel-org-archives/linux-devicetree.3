Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6040D586
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330044; cv=none; b=lsKFb2gl2x0MipJ2Gv1q4VadqDpiV4ZYCJ/5IvVEzXceluSqe9eWftEHISaoRugk6eR3FkPrQrrbjyX6ZUCdQbMVViJSpDb4JtkXrs4fiZu0j3150zYrxvZvXPQoyGLg9k1JoPWzJFEx539rkVnc4faeHVnuu9kinIgZFKEfj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330044; c=relaxed/simple;
	bh=pVIzRx7/3pDzYwRBGmmo6zbIA5I6GEQY9Wi2ilXolNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ep47sMALm7FtE4vzni4fJwT6GsZ8mQ4vZgQ8EDa31gYdYEH+9GeemQ8Im/JhDZnIkRM43M7b1HDdNhsBcA/2kABpjWGfb4NGqbJaWlGknj3yOx15cU6xu2xjzhO3erhu9h6t2F0fGRHw0oceZA78a/jSM3Ng0HfsxbgSdf7dlg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDp3WOPB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqJtwWlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDp3WOPB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqJtwWlV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694FD1128127
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=; b=MDp3WOPBRFA1Ic0G
	hpoo9y2k2jpKfWuOQz3s2HzjAT2oWoyUBmNocOrS24wi48B8US2L1Jud/304G9hr
	ZI763VHSeELLNU+Iqj30SfWi9/Q1N+I7CwRkjjqtAMHSI514DCJPvFqpcKE2axhP
	1D7Si13pxWzZQDbIVj1lkvXEjHsGdvV3GAZehBXAL63MqwDx8NQXFztYsOUn6ap6
	O59v0g972amioxr46itmTskTEB1GM/NjaPvX4Df/h0v8K/x/EU1JpSRAjNfUz3Tl
	O0XPqUeJZD3RwsCq5sFRDxKGaWmZ0aPCrPWo+jp/pWr4/tihBNITEqOBfuPyWoq2
	E2oXFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnkkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:27:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso66137585a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330038; x=1783934838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=;
        b=iqJtwWlVCrqnNSROhnjid/O8CDnAjRJkcGrRRiBALHqt7AiajY0/ampht+eDw19Kcm
         FvSumZXAtFQFQsljoeckyUzqPkOTxdyq6ct6f4JoGDOZtJyF0EZSrw415va0LSzjym89
         0sQtgXdcoy8asfBlKwRIqWUCBCvCMAboPpzv2Mi/RmEmsaZlkMGvQnjYQ+cgjLZvGVPA
         PQ7+OM1LQuC202o6ZbNKWgCdYN/dk8qhTDwNhJjKUuT3Q4wm18IPBjZQY3j+iM2N1MFN
         B1FUCcvk8N82b7ceNCD60IQE9H7ge1i/9YmofMhcS0SpCvKV3coKbzgyEmZM/WRqxvKU
         3xIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330038; x=1783934838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=;
        b=dJ5H+82Bc9m3aYx7uGB1ZtRM3/DDst1bPlwSab2fRXx6GytUcMEK2vP86h9UCNfWT5
         8YCGVkKaMyQqjXaCfncn1S5f8HdNYApWZ8qnCGjDkv3lJKuOz0d+rZjugKy64C/RZWc5
         jtRrg0BfMKvZ5mGspCnZ2YJCGOqn4xIsm2R+WpVRHgWkqs1BY3q3Y26tBavQ2Mhj7yJo
         ZA7aNg2VshHg7W5Q38m+Hj77RpaQv2ZqOOTQL1Bdzrcd4CRT2o4seizU1fNc1+w00Ll8
         YE/qZVaOfNlM04AIbnF8K1mlkLPWhZzRql5Wc1mv6HkirGqf2sScy8X9Yu8exrTViZT5
         aHwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rofbk3FJ5eTbfJsegaOMJWksz2fcmjRURoAoyL0+1dkdqzKwHL2LnfJaYQDAR7mXmKEMU5PZZrMOHdq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ufr/LWCO7SCmR/ydXqxBH/0XkfToo5WvafskZ1XTnQMQqVxB
	QAixxnJrIdHoUiXtAb+MiclcoGAp/igqjmqWs29RL5rnP2/jNXYncXfWAB8uxEz80RWA26Kuv3A
	9bkrw4/fsPxdi7+IklaqJrdq7AlVGQ/xhg36Zo4UzS1SSdcnpq0YozufRGKkZs6Ob
X-Gm-Gg: AfdE7clFfNvdX0ZZY4ZBujfFzQqqgG2OyPFPlxbIU7nFdntgl2M4gdnTC4zynQqasUs
	ObP1cftPQhQUzLsDLhu/BqTjFtsvW+nNxmOi1PPbQYgsfzWeJjykJQRVfedsQQLrhqpbJruVU7/
	zBSefvW4iptiI53KxxqPXNAspcf+FlYkumrjTjxUYnACAsicLsbZ80YOItShkNgtsWq+C2PRVmK
	15crSxZUfxhJjHeh7ybME3lYTcW9pvXfi5KZnka77RRkuQzZRuaypkAGMEBJoXvYT6jJzPkacG2
	2q//FZacGbVScb5XPrcnyeXon1G8jm3xyiUy4tQ9/k0jPALoQY11/2PdOXv3xIBLh0/CpmGBAj3
	valdRiDYXLQ2r8o3Vl3o1LvuwPzoRsGk3st4=
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86597231cf.6.1783330037878;
        Mon, 06 Jul 2026 02:27:17 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86597101cf.6.1783330037493;
        Mon, 06 Jul 2026 02:27:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b609382esm704610266b.18.2026.07.06.02.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:27:16 -0700 (PDT)
Message-ID: <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:27:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b74f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iAF4dUnUG2d09B6YKoMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JnkVTfDSkoHUkd44uLoT2yr3d5UgK9_2
X-Proofpoint-GUID: JnkVTfDSkoHUkd44uLoT2yr3d5UgK9_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX3hzL/8ug+p6d
 RDqiKYRm3Xy+cBzwKT23aM4CSkZKrjITry6HzKUXPZ3qnj0emesnB9e103WySiotVixBZPnDZEp
 YsY5lyvYCabA2Bi451UnoOxAgYHEkqa6el5XSDbPjNyCfEQMtZ+Xh45X0A61uHg302rZI5k946S
 JXsKQy4q3TrtN8EPYEGX8ft5DpktrYMZkSDe//hr4+sgxtMWHhElJJBTsvchrz8fLdeGfo4nhIO
 Z3BF/FbFS5jkK/r9OagvRrBI4Y1/MN67/22pHi4nkgnWIR+xtut+BjwCxCxhswbilcV/85nl3tS
 Ku4nnFNGHNOLYBjKyV4Ysuvyy3ZFcnJWuWb8BoJQExwmc92fe9Da5baiq7MpdHt2Ktn4SopYOb+
 M/QEgApzwzsi6yQh4+CGgtOChfbVGsTx0FOTYi/JEFG6xdXcePwFMBRTXrIuZZSbV5huzLg5OXK
 cZwfEOiZXfTMYuUBfig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX4zcFJAOBZGL3
 oGQ0UQhiGGIPri/lf0+iOnGzfMWnvY+9jw+RQzMUkbXagbTl9TrpQaRvS4Pil1vuSUeD39av9Wz
 oSYl5G8bNsG1jKQoJSxmzQaMOEzFS1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060095

On 7/4/26 2:05 AM, Dmitry Baryshkov wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
>>
>> Because the EUD sits between the USB connector and the USB controller,
>> it must relay role changes across the UTMI path. In device role, the
>> EUD inserts its internal hub into the path to enable debug
>> functionality. In host role, the path remains directly connected
>> between the PHY and the USB controller, bypassing the EUD hub. These
>> hardware constraints require per-path role awareness, as UTMI path
>> roles may differ.
>>
>> The existing binding models only a single UTMI path and assumes a
>> uniform routing model. While sufficient for simple device-role-only
>> configurations, this representation does not accurately describe EUD
>> hardware when role switching and/or multiple UTMI paths are involved.
>>
>> To address this limitation, per-path child nodes are introduced to
>> describe individual UTMI paths through the EUD. Each path includes its
>> own ports description, allowing controller and connector associations,
>> as well as role-aware routing.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---

[...]

>> +oneOf:
>> +  - required:
>> +      - ports
>> +  - required:
>> +      - eud-path@0
> 
> Do we really need a separate eud-path node? It doesn't represent any
> particular part of the EUD device. Can we simply add more ports to the
> ports list?
> 
> For example:
> 
> ports {
> 	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
> 	port@1 { endpoint { remote-endpoint = <&connector0; }; };
> 	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
> 	port@3 { endpoint { remote-endpoint = <&connector1; }; };
> };

I think this was originally born out of the role switch framework being
strongly tied to a single OF node (because the way they're found is via
graph traversal and not via a phandle)

Konrad
