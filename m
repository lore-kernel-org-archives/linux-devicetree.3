Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA94A6CC4
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785943; cv=none; b=QS0b4CwxPczDkN2ZOYxktQrKG/LzEBsD31rx1QL7yMS5iKZsTRtSDhj6xAFK7Q5+4FpHHLKbfxGJOa198Ws/PuzUn48UkefdnjV6DRo6yizbSXyFgsqt29MtcKYCg9H0s/5mmxPvj+On1RE2xERyTFRvnnRDeTO+s78w3eSXCno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785943; c=relaxed/simple;
	bh=DCoJBl7amgy1yhvT0dMKEv17zLSUXval2AKvsyCluU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZaTCUdQ2wfGhFEVVQGFVpWpgXc3KArIgp8CnYWo3pkBXGK75yzfMTQFGF1gUmDQbTBfixMazspq7EHzW51+1nWPHGte+LhV5LKQHQYFLosW7YTRka+tvR7/XjDxnOB5S63RKAexaijDIpxldwkKLNAK5xQlivEXyW7B++iFzVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGcf6o2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjDeGOfC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGcf6o2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjDeGOfC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnHGe3863151
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=; b=EGcf6o2UIIuEKCYK
	CaYp0Nq/4gplEhtVAlwhmQ5EslBXQU9NyFdO2u5HRtgmsRf0TS0UXDhNBEX9Kdmr
	S+6mBh5GAcKOymJvbErVkAnZUucs63xmwQ7h2wkVNaacjCSpyhoi6hpMldlUEoYY
	EGJ+oHo8kkRJ2MXAfNeZhw9mqtKRCmeRJxP0qB6yUn6K3zA5vmvAoeIDUrjSdvb+
	37qKC6ZNxjV/Iz7VfXe3LEbUD5qVQAwpRXXvqij8MFfsSVXQ36wCQLIZ/LAWf06Q
	3rwB3W+lTBHjlFSrQTMTi1bJu8X7/WvtNpbMciORo6r5JYKX0KH1zyunCm5/qEkq
	+4gnIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hw79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:58:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so64761885a.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785930; x=1789390730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=RjDeGOfCCgF3C977Vx2lOqzuvynwrkS96jRHKmKHIoDlDmOZ7nHEqGTp1ok5ryCPZg
         5zalpzhGz5OXtB1dA4KzICi/kGLMzUqVDf/E/bjSptrHgG9xwqvX6A3F/THkkABfG8Ae
         G6gL+QjO0MXwcsFUVg19H5VpdcPH0Mu6XU7SJIzUyH6VBOsFf5dwmrNGcvqToeo0AYC1
         xy4MpoZTe7ezskhg0gNzTp9xrhL0ztATBm++R4gcbQA9K/9LWGmJuAUWwfwxbkc4biEr
         qa6qyLIY5LFqwWJ890p1D7YjzJOfopIESF419P4avtj+tDb774A02sA7RaVDgEUzzWme
         7fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785930; x=1789390730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=G1ogXYM2FJ/ZgK51teJgh4kJk0v+eV76622xPRALrMPbwvkTeF982YGZY2Fk1hjAnZ
         ulnTDVCuHBE3ZMyTTRdofzHckkHI/4jkRbp0Hm3p2V2YOUSNiy/V8rN9BGOTBSJD0vD6
         Y4MuWxM14Py/k9+kUEpSQt40HsYPWdmXw77Kg85amDu6iAKNK/dY2E5SSiwVqZUChjmT
         QYehJXWY9osggr4UhvQXLEGs5prW1R6DFTRx8+QxQt6WA5O4d3cgxcRsvviwjXSHbQJd
         ylMjHzL1c4+Mvno+aTP1Nnr1uwL7LQUprcP/K1McT+jJOdHfUc7gx9gMP5g9Fj7pRYuh
         QI0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/PyGYaKMFzb9r8Q5v6iQykNwBVqXDeTnZg1OfVhk27jozi86foe/w8nkb0M4a+jJ+30fBuBC4bC5I@vger.kernel.org
X-Gm-Message-State: AFuF++miAI8YlLuJucxz8TowdK6ohsaCvQ7090IHy7zlF3JeyDRN7hbZ
	v+ukn72Ve6mmvC6BFNnwn60CemJ1j3x6iLzA2VSVZpwSyZawZN6qR9xN59AjSt8TdBkeG3G0FL0
	RMXu89vLWRjhkxNxHhB/m5AB5m5ameEHhlUOhGU/zuGhiTI+U5LYx4+DZoBPgyMW5
X-Gm-Gg: AYBFou3uG79AN1v1wDSfny/38I3y/JoTnnC1fPEmI8rA3SNrgHYmasoDZsCqkL4mfnD
	nkPmKESB258khAzA2A5AwiszpskNPyNYbED4Nh7iQUT+5kIHEQp75zAJ+hDqWYZIehcMamhqrbg
	EvJqeinAkuSrpSbg10jgOopburh8TUmrOw5UVXavHH1Pe+YT3x+N3fNR7QEjL/96flgaE0UEleg
	wVyDldgwRss8BhJCouIMk+XqdZvuEtmkR3qHEB8/p6ENDXk12O06mkltYwtL240sjsJKEXnSXnh
	pvQtJEC58pPcsa6wUFTgIPCOK6/wwf08hKwEi6e19NW4N89U+KBD272xSYz72qhlu2iMsIfg1eB
	kn/wLUgQuXWXMJbYQ0tQtaQ==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1857110785a.4.1788785929770;
        Mon, 07 Sep 2026 05:58:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1857106385a.4.1788785929336;
        Mon, 07 Sep 2026 05:58:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9889sm4250685a12.22.2026.09.07.05.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:58:48 -0700 (PDT)
Message-ID: <0d79b582-75f0-4577-b4f4-a028f83442b4@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:58:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: ipq6018: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-7-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-7-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9eb50a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eOjmzPK-e-Fcs28L6Z4EAfbWhx1-KE_v
X-Proofpoint-ORIG-GUID: eOjmzPK-e-Fcs28L6Z4EAfbWhx1-KE_v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXyqELPb7l8l2t
 WBjboQfICv+B0di+16nF9TABdSxEd8N8n6J489OZ/ZA8owi2lKcSjImoZubPW/3uN9fnmmEmn/O
 bJ5xNpY6FbdFTK40SzFhcDesQZHYk5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX9xStw1NRQQJI
 s0MQR+Y+yLUwRXW6o3OD+SGyqXxy5BBttvgFZQYXyUNvJCro9yWP957/KdHaWihkybdeft5qFry
 vkpjqxTl1IlMJeRq6NgKNPusK9Np/5jAyq/TfRRvnCtyqpeFz5eMlY759x7UAFdr7ZmEH1T+JCO
 nE3GRNkVb4AxMjy9GEqupRgVNXJ/sHQUBqio8O8Bu04UZgJLLwLXx18IED39QllIsn33ED9AX9I
 YiYMlrFdBT553gm44zVJOum3l7GfcyhP2HLPnwvwjFXAr6Ba1sxv7EwyqmRZ3Nh+e45F4RhrqUb
 VU184z0cjK55vsM+uM6UBW0PJMzwlM0h2MdnszMzPqWuj+MLDx9BsoxyJhwUVCEjo0HETZzdpRz
 1OXSGEPRYOXfDxQoblrqBJGZSqdbaGsBiC0hM2MfOX8ldBBbKePhT4Ptt/KtDReZgf/hQqI+/1q
 HX7rSdW46oIiG7rpHVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
