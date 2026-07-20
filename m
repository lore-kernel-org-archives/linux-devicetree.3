Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6B39A076
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537571; cv=none; b=Zj7GZhC7o5ExzsDJV2kIp3Drd89UZNkg6oPcj539oaG6gREzsJSbiwYSRL/yxnfYPbeOPCGGAjqrni0zPpoKWH8Y49VWn9QO7NAt52MsBcCjvhDffugmRDEKEb1u1dg0v4SrTyhlCyISD+a1KwaCGoWTFEv49NzYVeW+abgywfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537571; c=relaxed/simple;
	bh=vd1FkcixEWgKJFb8Do06MPkpUlB5ON6+iKKTYabxPpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKf/QYGHCBIxqb+6M05/YoLRmB9CPO4RewcxNpGgO3FK3/HFT5OjZk1Gud+sYZYgH22suUCqd5hofXgd72koHqf6GlICZE+1dGqFIUdPhuBFbZC/Wa61xTkfud7sq4JeY2joobc7Ahauh3GcHgcMuTC+yH1vbuYNS3a65T70OSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUf5XUT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsKFd/q4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUf5XUT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsKFd/q4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76RgF1712957
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khrEdLV5wYHeiPqKWkgPxtADj2ISUrxQNr9hY3PFgd4=; b=SUf5XUT1+BVq7AjA
	t21+n/XreHUfj15ueWtKwTsL3BEOcKaTa0eE+/5TxSU3j2JkbSk4tqA/Nzbwrux0
	YwOGkfmTlWkIl/drBL+BhkcDBcsBqaGC1jmaX2lO2oo0cd/B24Ywo+eY6uH05V7v
	AoBkYkHINtjFEr8ux5L+26NJyvdmiZOnXyUt7ngo3Q4xlcYhNo+PBH7e6WI2/uj8
	SBwxe//R9URZx657aCii46TpEXERqKEDdFzXQ9rsZFD8pehsH7hqFsTAqHOOviD+
	NjomqMbYiKeoPoSUmLzYFbBXomt+2IcQXnCt6LzyiH9ediIwumDJJwAuFhZRMQm0
	hrCFfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c0d25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:52:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-901fdbfc3abso44728346d6.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537568; x=1785142368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khrEdLV5wYHeiPqKWkgPxtADj2ISUrxQNr9hY3PFgd4=;
        b=VsKFd/q4Vy+PdhEysBL1ArJdwvYiRlMBsKmDCwCfKN+tR5XH9UkQR8Q3YyWgiKpVxC
         NcEHpsr0c3Nzv7cZUUtMbQWDKNfUYiqVFgnoasW0vIzGtHKx8j8zhC7sSFZWD42o4izL
         hbTIlBhfgV0YW4apgmgyfOz7O3JOiDq2saHW48/XgFDRayHVbZ1craKFD0gki7nqxG6M
         xO6bVKmh2Ey2MMG7LTAOFHzEzsbsVGYHqkr/NcxP8j5D8ajj4doiii5PYz/nvGKd0MYq
         FZkZ6oYrnI6Wv1HSmR3lPeh3JBOBtZW4crmVrdoThGNF6zfdp99PsBs+ouk0vz6wHd8p
         08HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537568; x=1785142368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khrEdLV5wYHeiPqKWkgPxtADj2ISUrxQNr9hY3PFgd4=;
        b=D3j8xctsmSrney/7b9wy9lLyr8VxtxshWvh8iztOlTV09b1alu1yWWKfhCXUuoHqd/
         9aYc2GPoqw7hIyg/9yujdTpz3eXpaK7IXinVthQB/OoqJeeYFwRlrdxHq7ap+9x+RMBm
         Q8AkzZHlkO0q0T2JdZK6Fkrik1dxn0w4O0X79xesMTP/8Dc6PlHcCILkREHrpiBZrHSt
         /c5lqsQFG0kyKq/3Jq4H19FBDI7lCZVs1qGKunNk9WTBzjKdOTkiA2SIsPtx4YR0sXYt
         o7Fz9UgXoqrK1vVhtAyVr3QH1ofRuMpTTu5qoWEcog4cFF8I2vJ4fsOhLlCve62rBSYd
         0e6g==
X-Forwarded-Encrypted: i=1; AHgh+RokwmuvEFxGxKZ8II+MbZMLWEvBV1iUwUHJImQTlj1+tO0+bPTwAoDu8cl0hbSwxQvFhiO+5lYtYOGC@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfsN5wdiWSJhft5QUw4dyuTTsGBwhITS9iRzi8Ms8AFXhwuJQ
	IWIgEXWXdkJNmRzq9/sMmUjN1itEnPWysmjrwkrjw3V45KdqjRM06FY6x/HxmVSoEBQvayWHzhg
	STgRp9V853QD6VM+hg7Y6GQMp3tP04koUujnBnStGDMG2nQnnWMLSer+8VoYAWkZd
X-Gm-Gg: AfdE7cmnDy5jtvwKyXMXVnWDBiVJr8CNoAkgIOQ39TWXLqM97gcrxsyXW2wizCRltsb
	aaFr1nL3OyaenCbMO1Bo7Z0mgvbAHN68v6cxrWXLq6Z+5kWigoH3JcBj9AYeHGZMEJgLoy1ivsg
	tkDnml7c8+2hEngqUAlIYtG3folpOm7bbpRT79c3gSJNktX5YwVjMxueRAeF9Tm69aRNdl8oIw2
	cHHLm87T9YWLZPAcoHc0ViipgRg5yJT+njvGQF8TQ1iPxRz8mwIViIihKpJ23ZRn46VUNznF9vP
	g4auVGlSPJh+u77sDnbdPASARJFCIa6HteeErdNHiqDb0YaCTYzladrA58BPjhSpvbn9PqNx2uU
	tp8K9Ggng0RbNs3oPJ1hU5KsA
X-Received: by 2002:a05:620a:8804:b0:930:831e:1299 with SMTP id af79cd13be357-930b41bf48bmr992555385a.6.1784537567817;
        Mon, 20 Jul 2026 01:52:47 -0700 (PDT)
X-Received: by 2002:a05:620a:8804:b0:930:831e:1299 with SMTP id af79cd13be357-930b41bf48bmr992553785a.6.1784537567401;
        Mon, 20 Jul 2026 01:52:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f986sm430075566b.40.2026.07.20.01.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:52:46 -0700 (PDT)
Message-ID: <2bc870e3-5d2e-47a5-b5fb-15d6749644c0@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:52:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5de1e0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZAuWv5OiGsYHQS-HHhcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: xuZsc3d0eAMcfoh_0DBOQZdypXZDDN_p
X-Proofpoint-ORIG-GUID: xuZsc3d0eAMcfoh_0DBOQZdypXZDDN_p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5OCBTYWx0ZWRfX+7506Kr1c+iZ
 XFCc1N/zNPfzKlCZ4M9FwQk7NJ+fV+K0OuYRJrUA1rjsN20CwR3hil0rBdRzYMMVRYc4otBlxLL
 sUytNGRuq+FzbLqDLgvAH9jz0D9BfW8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5OCBTYWx0ZWRfXwJn2ihRlheoy
 pQI67I03wxxl6UrFN0cWU6tvueBqNT3+2yeJMrFicvuAaFTyirN2aChSj1xwsD0p7UcfrL44Ypq
 UDkC8ZiQ8OKPpVfCJJzc4NHyFpKC7ZaEEGjmlxqqe6s8dkHe7+fdf4YNc90AJr+/7dbViLaDwmQ
 6Tc/1bdLXOZq++5jQ9N1W248wvfsqyjjUx4hn2ug4pMNJz6Qx6yNVhuo+AXCDGsHpwlS8b8xMk9
 mPYaDuhCdHxZ7kleHXOY9rK2du5JsWqw20dWcuhX7at5X9iW+1hruknta7J9zktDchq7TDkGJDh
 gyDp5yhgjOjEu1NRWU3dQMxF47pywcWLP/hzU6rFIjD40XKLKP65Epog2eH4E4TKJLzJ1ZXE25m
 gVZDuiIhiPxAJnJo2exWndnoAV8RE8iMDS87jeZWqUGLlO9ZY5e898DL11O2Fm5pmYotk1NgGzM
 3ZZ2ck6MSyrRVj4DqNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200098

On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
> Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
> compatible to the UBWC configuration table to enable support.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
