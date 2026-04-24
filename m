Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FCF3939A5
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028343; cv=none; b=K7AT/AVIvjtA0tg+AVzZxb44iq5AF52pwLHIeDe23KzEN0xlGKstNru01UNPOVbsYxMyWBl1IWL/+LzWtOMz6s4qrGpjSwIkdNHnnwvuI61LZvcXVkG94go5lLuxPnEDlySXANFipb/zLbKXq8HsKASIMzD4J4TsEwYFZWkNul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028343; c=relaxed/simple;
	bh=YKWVo4hTTh2VVnID18YaPKZMYn8hdTJn/00Ifsbtxek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqB0EX/lKVC/Mx/h+GtZdOqWzOBDSZAKvXLptFYMDwSeylUK8z2uR/ZMwiiQgnibdtF4omRNKZWz/uPUK1cW3bgvyVldLPGvfjcpx5B13BwLiWm146i30LjXixPpk0LdZ/7RyhMMLBdjsPg5pdnOPSFaDHPfqRUVhgwa7MIlOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bbv8eb4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVoUOVON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bbv8eb4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVoUOVON"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8l7X72710328
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53ASJo1GxCRSOJhL4iV96kkrerGgRf8DfIhzfgftXTg=; b=Bbv8eb4aR4PzFDVW
	hrnB6W5hD/XfzoBWLEGDhbgX0bf67OPnAlaWWuo3HNYFCWI7FIQI7hD7mTDsHMFM
	YBgztv39+nm7ngkigwPmx24Y79MKgUnAe9YvxkoDv+X2NBfmZ8TVmdXftqLkXBTt
	KHo+tcaNqapDVTtflDcBWz3l/+dhz3U/6RWft/wOQyCDCDvR4I9VuNHktF1uufoS
	9w4HMVZcLHwY0GJTlwK6Zma2mxwI2WouWq5axKJpLYp9dn2xiybXtO4jPYJW/stf
	2h3DmiNI5+mE9lfW3lYM57iRntvHCf6zJOBCfkO7NEGdSXBsLnbghwXXCJF9n+1w
	yJYMgQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9urge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:59:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so21234056d6.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777028340; x=1777633140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53ASJo1GxCRSOJhL4iV96kkrerGgRf8DfIhzfgftXTg=;
        b=IVoUOVONkQE+TDwX4tmMOrTp3W5vfIC1F+7M1y+KztIFKJpzKu/r4ZV9YlB0n17CKM
         xn8SriOWJ5EIivKb0fkxYtf2OFs/FCtEgoXODwkkeCawOiBwfOGHJZXiufwi+I5WyJrw
         6KNOaM2lpxxuqIraZ2jQHOyK4LJ2PBnzG4I6hbsIEsN+q72kDUXNHKxacP77G+adeDAE
         u6JrF0Lqqz7ZvZxcedpZJsYQUy0nbJ1NnLfdfgR6l/oMgwzJf4pNcN4qcbtpHuRud4xf
         ZHTj8qOrb9V6GB/9T0a+Fo7BO0Evzli82BtGcNSKhUcS4oWLBX1Yhw6+QRY5InIoNj/Z
         HF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028340; x=1777633140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53ASJo1GxCRSOJhL4iV96kkrerGgRf8DfIhzfgftXTg=;
        b=jJ6QP5A7lAR02kR6O2+3JU+QT9698gMx9Ui4TNyGLN0o6IaJNs4T1mT0HAMLSD0wdO
         Yuq/9xihN8rxSwHv4+ojkD2tDkJV4Coczw88kB4/VAq+7tVLHqjS7PMPgCClFNyTE0Vp
         B/aMRtl4CJHUj+pJrv2G6fzzDviGphnmIf5K+61wOZmTB0hDih8me/OhAjExWmEBzlCM
         IiQozAZrfzQd2At7TZkTXaHXDC0Ldhwfvjq370yfzRP4SI2Xj16tSNjXmwAlKFYy8hsr
         I+vQaID3Z2n+9Bvw9LwZb1ryiKvC4KF53KpsHRCpP1K2Ke8vfhIlI7UwRZiHqAVfDW28
         JI4g==
X-Forwarded-Encrypted: i=1; AFNElJ881yag+mOdWmjeTcWDYXTMUMN0r+etypmi9lr8KhXMWoInErwHGVWdzH0k8INkIdm6pqETV4uI6/sJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCxSoPBVuL1USOMQfagQjXSaS7F9TMtZCC8LU/75HiXKuSGGm
	sztlhnjrJgKDnNq/V2QhSW0dPCOm03FvJUosAcXrf2auvQTb3bd/1fhHn9ijFKFPimXBua4gzcI
	5OPeHHoan/jDHyzKC3TA6D/hHJ95Ys51mxvHnlCSANGo5UJUx/CdZm9NLlzW2070U
X-Gm-Gg: AeBDievBB2cfjiN8PwaoZD8nwePCR6XJy2mnzRGwbCbepoo+bvdHLc24mxKv9oad9nm
	beXC02srsYEToXwfmH1P48TZQ6QdhYHCQBywgPpixKOZZvR8svIbnPa4/8XQhMNZ1/4cq0F+H5h
	ZRcEPKk40DuY33pgt1g9w5A9YF0ir1b7QSLThrBCnunm9fTOQMiR3aokKfR8sfiF73khRNjdG3S
	S0BirBvOu1PG5mAccGwDz7d97ZiOgDRUyNnkQDTNwOU769Lce72HocfTrWkQlHNC56j031Hjup3
	9kdqX/7SMgbcPL6tT7qjdUT4BIeGX+C9INItxa/eJZaToBBN9hb1XB6WreoUra4PwqL0N5kyu95
	QHQndaWlzvjlGHklcCRulLd67JPJj8dwhAtej88aLM1aVynMZ6cCcv2+KVgQSakigG3h++7oFjQ
	4mrpQxKFnHDj4Z5w==
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr343234326d6.7.1777028340478;
        Fri, 24 Apr 2026 03:59:00 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr343234056d6.7.1777028339983;
        Fri, 24 Apr 2026 03:58:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e26sm772516066b.8.2026.04.24.03.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:58:59 -0700 (PDT)
Message-ID: <22b97f4d-ea71-4838-98cc-470dbca728c6@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:58:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane bifurcation
 support for Glymur
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <42a9dd4d-eb96-42c0-b836-dcd7cb9405ff@oss.qualcomm.com>
 <aaqdv7Zx5AODzg6P@hu-qianyu-lv.qualcomm.com>
 <fb75023e-8fac-49c1-a8b7-2eb8b70fda3e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fb75023e-8fac-49c1-a8b7-2eb8b70fda3e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8lsxgH54V5wNPMWgtgJJRXdwCVxztNWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMyBTYWx0ZWRfX1rIJBcijAplB
 /opzVlLdgOJ905wi/231z9HeGyYZMvnWkVzGLWQQEhGf9nKLdO4mqR2LQTNf1zz7syeJ0IKInsJ
 LuBl8mAE2QOdM3q3HICsRJuRsBBs9JWBn0MJbLqgiu5dZpXh+gGxpsQ6xOxSjYTzcsv551DEqdz
 3j/rz1ZxpzlJM4ul6inI55EU5Q+lhGHVfMQfofm83Dil6nBFR0waEy0bmRvokHqozFwtx0uGUdb
 e5wUTSzxdLbgYhZq9cvHOy0AVmj8T1lKucGNQgwUTmxqEe+SNr8dm1B+te1xSx1hslF/l4c7blc
 DrF+Do0e5duC7rSMS2KkELMijQMizlqYVCRC9vHXbZuuhaTFcMgW3+tD1U1edd0NIbfdujMJPKQ
 QT1ueCXaa6Ep/l/UXH6070rspEsVFsf+zo9/VTpwd4SJrNFFv3XqbeLHaS2ivLOv9I+sGx9iEmD
 7U0cFHIK1kSkDBEUVzQ==
X-Proofpoint-ORIG-GUID: 8lsxgH54V5wNPMWgtgJJRXdwCVxztNWp
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb4cf5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Btiq9F5UgLBRDrkW77oA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240103

On 3/6/26 11:34 AM, Neil Armstrong wrote:
> On 3/6/26 10:26, Qiang Yu wrote:
>> On Thu, Mar 05, 2026 at 10:14:05AM +0100, Konrad Dybcio wrote:
>>> On 3/4/26 9:21 AM, Qiang Yu wrote:
>>>> This patch series adds support for PCIe Gen5 8-lane bifurcation mode on
>>>> the Glymur SoC's third PCIe controller. In this configuration, pcie3a PHY
>>>> acts as leader and pcie3b PHY as follower to form a single 8-lane PCIe
>>>> Gen5 interface.
>>>>
>>>> To support 8-lanes mode, this patch series add multiple power domain and
>>>> multi nocsr reset infrastructure as the hardware programming guide
>>>> specifies a strict initialization sequence for bifurcation mode that
>>>> requires coordinated multi-PHY resource management:
>>>>
>>>> 1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
>>>> 2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
>>>> 3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (bifur_aux)
>>>> 4. Poll for PHY ready status
>>>
>>> I think we never concluded the discussion where I suggested the
>>> bifurcated PHY may be better expressed as a single node with
>>> #phy-cells = <1>, removing the need for duplicated resource references
> 
> DT requires strict hardware description, no abstraction for HW, so if there's
> 2 PHYs, then add 2 separate phys and reference them from the PCie controller.

A single device *is* the strict HW description here. There's a single
shared top-level set of controls (mostly in the "COM[mon]" block) and
8 PCIe lanes that are (roughly speaking) unaware of what configuration
they're in

This is very much analogous to the USB3+DP combo PHY, where the USB and
DP parts are reasonably separate (you can turn the USB or the DP part off
independently), but those are building blocks that are sort of just two
"front-ends" to the rest of the QMPPHY hardware, that process data from
the otherwise unaware pairs of lanes in one configuration or another

Konrad

