Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C630C51AED2
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902581; cv=none; b=IYs5pKfFKHZHG6dq73JQCxrRcBwxDOjABOt3y4AaCdAbGHQvp/OMpueV+u5VrrpJt978OzaWqKxmy6/+x2XuZD+ep0DHbpxExaOqihusqoRn1LeXembCsorWdx3Q2J4Ct8W66d2/Zcki8Ag9/tbRLMapL5WMROLRXurPNkpBQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902581; c=relaxed/simple;
	bh=nJihTvkKW/jjyq9FDC5njYiM5VHlRg6tH7LUP9HrO1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqYadd0apWqR+AgfFTu48WAkZsYY6jxbsYbuvHcNXPdG3Cb0hE88KW6BGfVqwSwKKFhdWY6OwmgO4nVsfv06NTY0RoHJQW+XN1Zl5W9v5tiJ664C6WuVtSx3aK9ITSogHdj062dgX+ASduHosIG8c3Kx0BL5i6M8LxQxYSfTrjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhVsVR76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYrRN1Ux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhVsVR76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYrRN1Ux"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE44j4009430
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=; b=BhVsVR76itck0D3z
	zg5QPmRmTmTshnVrtAy3gUypdrbPrRbE8opK5kfXg173xKSMZjBmX5h3XlasoTKe
	WBCAx6+Fn7xz/IKL5I0X5EntGwE+mITdDgaFAO2+vnXlRSERTYXbY5k8dlYaUEGL
	1AV6rBZG1dAZN9NUvpVbTBcbCcC5hfHe6Jr+QNG4MPe33R/YZ07oJhLOWUHe6S0Z
	7onQOckA4TbnYyW7YP5yoKFR59O7d4alksWf9l/VNSVURANpifW86OXdP1OdYV8P
	0CDHXnifePpnH1nC4eBY4T5CbY2VI1NCH8+r/mriwmPRmc+JqIO2VsOj5QOsKRJH
	f7ulKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjj19k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so19852585a.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902579; x=1792507379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=;
        b=CYrRN1UxNVjOJzrltHuRDmJbrMlT8O8FJsAokPVtz+XYzVP2/A5YsMXR8ojja6ZlmM
         T+JAp3LAnJgFIluRAMXB/wrIYT3aVnTVbRlRCkPxd6UFrJSZmeBHAy/kgKscMDAUsnPo
         DggqCGBAGb4Ck3r7IrJRuIJtg1CAfXStqjmhdeBM+7j/riCKlwM+L2qR+jwnt+1Cqdac
         FuP70IL54MBKHaYRNZIPWx+mmQ4iqkTkT0n6kLKGhteYTZwPm8vmNQKlI6LacA9gzB/n
         YSpPRVPLO8JmSKNbrJRzNOpzsimuxUVlqWsgNCnNBZy5rVTKv7jQLRsMq2NCK69NlIuf
         ybBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902579; x=1792507379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=;
        b=bnc1pqCBKwGCPk3DGK5kh2W3MB6HaMYCsKVpP68eer05DS7FrW4LFUZEcFupY2tRY3
         BRLnkzBXFYLJRdRyzSe+7K1if3pHmjQ7pIa6xlQKVRSjmB8dRVm+eTXKgovpUVAkrcJJ
         vmeJp2oTQST92MJEdpaL3uKTzzLSirpjhO/+uUTI5RrszPdfXWALKWG8/N4vOXdNOpmY
         imH5z7V76Y22HtyDX0zUURxrMBUC5YxtpAHnBSa2JFBfI+ixcn/6CBfT7HNHBIGD+xL7
         M44Rl1F+lDD3CrvbHW8P2OsUL3Dmzwwv+eTqGvrCOkmbHwpAKppEve2htML6TfHHRqH4
         qs+w==
X-Forwarded-Encrypted: i=1; AKwUvBxGIs+rF2xEXYq/qskwgr3P6GjYZK+sNlYztzIgGr1QhKRrV8Sx3t6d0n8J+tpFkKFrjNEJDFBBpiZR@vger.kernel.org
X-Gm-Message-State: AFq9FYJJpvbfIk65IwRKBvX+Ifo5zo92hgFV3sCXe4ceXGNa6X+O1TZv
	xAbjxJf3P3mNlHVtIvs3sqFI+yOOUcwTJ1vuTUdPGh+qw//kFpM1iCGsHzUjINkH6nItsyW+OSX
	8BplUdLOSO/KkJ4FQL2RVR3hEJhhYgy6HWIpT5n4theuHbRL7UH2on7VeiMiOc/5M
X-Gm-Gg: AYBFou3RJgYjuHdh1BwiT7vEVs+7XcLmOP98isMC4gAf42wrzJK6QaPOsN4vgLhKJQc
	2ddEm7qZF0zpAm4EQBbZeqCz208hQHpXILPRBFv+7486TBv7NsplyDksOJChinzIHvbP0gEcKek
	1aAY2KZHDLSNbWMFDfSHQ76ArWzx+jp4aSVN0TvimbappbcxBJsR70UWXho18I1veJZLpahosna
	9wQq7qM/E9t6AwElgxOkSKJIBmT2PgBL9RHTuguxJVRPRhLlA+OB8q7AHU4nEy1TyGA49Mc+rGR
	B0MKHN252mMdWv7P8hspe6/8Jyw3F3rDcLzBWrNvbTHgIMra6J9nBcL+EbgrW/NnDN5g/azRwDZ
	dc3RCq6MMImpYgK9OVFqn0g==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2186833485a.0.1791902579067;
        Tue, 13 Oct 2026 07:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2186829885a.0.1791902578567;
        Tue, 13 Oct 2026 07:42:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9764cc9sm608540966b.10.2026.10.13.07.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:42:57 -0700 (PDT)
Message-ID: <591af0a5-ff8f-469d-b7e9-7e0d72b03ff0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:42:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FnqAyT8rt5TeHDGfF9LJyDGhWdIwOU-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfXxKlRvO0YZkI/
 8hr/8Trdo05pC3iTEPCsoI6lE9jqR5KYWCcTtdHTAIcyFN8aBEELpXP5iSmu9Fx22ht7FzZ15C4
 xa3NC6Hj2UPuNeovl8InLgEX+ZakMwbjpmbrCKJsMcDsieZHyD1/ZFso7P2pcJKPktZqBExOtUD
 NjV7uOkRzztFDfTb8tNlwYbYvBxJr0mE1SOtiVG4nhKeP5SpAMUnTcfMOJYryq2K57AQMVXp9n8
 lIrBTxt6d59L4sNFBOjWQsMo1kBu1Z4+P/0/jfGdyshEooGvffFu5ZXKnl2ZNDzDyfKAjlbEst7
 K2X+oqdqXuYe9QXiV+Xz0eOhgNX6Rzk+S6SvcE3bXWIgyobRwNNoCOOYjPnWUelXIxqHZtVU9vT
 r7Oc1UXAcOJIViceIoTYNxdtZRHagkO1hG/omyasiS/JASIr3VyvizWI+1nZI7JQu71nQ2VZ+LT
 fMOgpWe7OxXhPDl5smw==
X-Proofpoint-ORIG-GUID: FnqAyT8rt5TeHDGfF9LJyDGhWdIwOU-Z
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace4374 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kLrOTjvlBrV8dJFV1dcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfXy6vUJBd+zzoj
 Y+LVkl+QMfUsDhYeXObFoooaZ3LblO1f7ipW/cfv48pplQEGji5qSF71FLlVsug6pKStEFw165n
 D2vLsupSs3vw3Vb/uZrBy6k6Hg0BoU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
> all CPU nodes.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep_0: cpu-sleep-c3 { /* C3 */

Let's drop this comment and rename the node to cpu-sleep-0

Konrad
