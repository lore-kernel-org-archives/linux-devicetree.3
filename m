Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADF5388379
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998160; cv=none; b=uiu1VhQev37vk9Wm28+rwfAp7U37k56BHMPZfmEzey0ikBS/5rngAyTXcZSiYxPV7ZODBzDpRg/4yk2aysw3Ua8zCgfl81UzuU63tW0a50E0jtSzGM5JKLNrH+Gx8xHUn1Og6JN35P5oHg9GiDXzwwTAQ2+Zy0NCXDMcgiM2kd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998160; c=relaxed/simple;
	bh=pRLtaagejePOW2Fg2YPKRLjIDCmXJrayZ7Q5GXWYh/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfNCpm4zBwGJQ5a8UR8nnm1qIQHvs3EA+pthdpuL6Zhgq25b/B1M+wCe2So3bdEsTwcOcs7I8BQD2u5dn8bYew9AmdOpSNcJS7C6cTah48xBoH/SUutVP5BX3bdJ6vLfw/ORb5mGgZx3gp6hXFU1dSoB2kLzp75Edoyn5e1uh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/WrcX8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yong9F7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/WrcX8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yong9F7i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rcoW2034759
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3JNmHHdS4gAWMcgDN6ouymySktpffftWHFLxG6U5y0=; b=K/WrcX8E0ZBjISFp
	zvEvM2wWb6aedQVrpP1VJP7o/C2QZcd1L+J1uvQHY5Skc/GuVZUHIN+ohIPkyLnu
	UBBj8a/TkMuSDa0lnqUSXLsLbeNMxOSOllhLSgaNTIEQ5RaqIhJNSjnQwhjatAzy
	G/0tMUurbiV2rUQx7Mu2fay8naZ0d0GcaWY5He5Wc+UvP19Fhc3L6lxUNkJnA9Bi
	2B+Rv5bog9rDlUuyBzJ3/bXCBrir7s1eK0FonUZG0bSEYv3b0wVzjtReGPRhnBjD
	yyFpLMSKVTfY8WOja+ouWLEvt3PdJRXbrhpp/URUa97LmiCc72kCYOdK5g/RCh9d
	+dveCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearj2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:42:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915732517cdso80134985a.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998157; x=1781602957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3JNmHHdS4gAWMcgDN6ouymySktpffftWHFLxG6U5y0=;
        b=Yong9F7iRosT89uHwTFi9F0BxkFLr5GSPfEwGhTQr0HMJLcqwr7JNkibrrEPEDip6P
         gwXF2g+B9Or6UKSBomPBFOcD57qBKzDnSoscMtt53fbNMX9XFi/BAqyANvk4vCanRtg5
         iGCKpgV5aG9z0xqgJ0OT76yriXoZSIeHK5LLixCvgrX1+2JhfB0PLzGOBk0RVZbVHSGN
         0smtTIwMDATPjbC/MwE+s2eg/bs7KTcI3U88RhRLleXq5JQQL133RJUJL/Q8jTcf7e/p
         3lQFmOtGSW5Kz7xqBPRJapyj7obHFoJN7YSdtP/wjxtw8dGj0A/LOZgbuKier+tjbgN4
         iuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998157; x=1781602957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3JNmHHdS4gAWMcgDN6ouymySktpffftWHFLxG6U5y0=;
        b=jc4HkyYqNtJ82UeaEFMrMmU3mgngwL8pIj406KyyIByetEUd9LhEKH8s4rxZcEt7NR
         P57XfvuPVSmWMY5Sc2VZ5ycowJ3Uvk4kjrIcjZEKQJB/ydq3hsNXmg5slT1/HC013Lpt
         7hAWTnSfGhtf5SYBsT5rI/dCYLOmCjoEpd8kltmRher45Zq0JmBabLbIXwaFoJUkBJb0
         q9G9iGsWxWaGGhk0jVkMOvOcqwMXzbDvpWYhSoVc1s00UG4iaSSnOBmQGSjrELfFhZ/v
         qe7nJmjEURSxfnamCdj1f/jRM2Wm5KXHVSycxRql9t4pXv37Vh8EH6o9UEaKI3sRtqyj
         zWoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7OE/F0hBE5Iyqh7TYAoBKLm0Qs/tu0Txlf43XQqrYT0wnrPXbWz7H1Udaom25Av36mvqbrjwkRU7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/KhOxdLLvgLARoFd4/S4VMbXspsILtwWSOqjlM4tms1TIfsG
	W2JAnTjccAb/R65vQZtgATeN0ihJUWP4Lp93Ti5bIqu4QpliyyjGvpNrXp2FiDCUx6Y2fVZp15B
	hnU2XSpge1jZU7CXjz/YsrSdSTXl3E+7cHtDXOxi20EtE7jalZmrxoKWX61siJCcX
X-Gm-Gg: Acq92OENNRUMuLigcmheY9XUCG4pd4+HOck7EzX/HNMW5gqpKfUtk/ofuHklhisT+NW
	NAL+sWaMkYHudvwCk/CNNUxBjRBz9iz1CVJIFicVmLOpgyRn+JkKpJ+xWSpkF1apC8mHQdUkkBW
	QOk4x566NLE1z8lyEUrgT0pcNQgDr8jhwePyUcT4aN5HYbT4IaTogpBM2ohuJqk0GmS5gS/dw2S
	wWMG6r7wRj1+8fmNzsvXK+txToVAnKSBtPeruGSQTu7aEBkOB9ojcMI0A6wvpB1CEdbbEfBs6Gi
	iHyFF3a95a+Ix4rQDKzYbCF3l5lCC8dTz5m9trlJ8CWxWFJoN1XuuKgOeZUVdj/LbUZPJSOCBrn
	b0cYpQ7H+bWIbH/FpviJnvjSQ0tBumxnIKJz04FWNDDtGjPkCQFw+0a/B
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr16784571cf.8.1780998157566;
        Tue, 09 Jun 2026 02:42:37 -0700 (PDT)
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr16784311cf.8.1780998157110;
        Tue, 09 Jun 2026 02:42:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1022558266b.55.2026.06.09.02.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:42:35 -0700 (PDT)
Message-ID: <d99447c8-f140-4ac1-85e1-a235c37eecde@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:42:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: Add thermal mitigation
 support
To: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Umang Chheda <quic_uchheda@quicinc.com>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
 <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RqZvfCkliyZCY9ITYNaoLl72rGi6gwHZ
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27e00e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=yrFiz102X7FNP_QAQpQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4OSBTYWx0ZWRfX9+8bpHE+W00W
 sE/WPUPAIfIzQrGqRI0dAJBT++MOAFKPXVB3b+M1a4onGuKQpqN846k9nUo23qeuu3xAMqWLEdJ
 6mWTzgTtF/Sle++LXUKx/I7Ll0dVCtTNkbOGB49KJ+YsZ/H3+DJvLnvebkYE2RIZPyqZWBvjrO8
 x/C0xcjaJ7DwEN9d3JBcRKfWhbTTsz3PefmkG4P8qhPYORF1AnXH3VMIyIRyane6LrAVT8D5nKc
 /gTuz3FvRKHXYiCxzWIxaaQp2VIoVRZ9xyHhh5sLIOhhMRiguwlGS/KKsQ7aP684dIDZ1shF8+h
 CJZTLHSVbwY4u4zn1+k21XLNbQt5gWIxUKWvcufLp7cOetN1pQZFBL49jeXuYQ8tTQWXnwWOuBu
 rPBliwSHnAeav1jjS/Sc7aJxKXnFz5ttH7ryU1jBTD2HTfwA7oGF7dIiqjgarc6Obfa0tyYyA33
 cHDeQzc2Y9afxZSpzbg==
X-Proofpoint-GUID: RqZvfCkliyZCY9ITYNaoLl72rGi6gwHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090089

On 6/9/26 11:16 AM, DhruvinRajpura wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Earlier commit c85c191694cb ("power: supply: remove faulty cooling
> logic") removed the automatic cooling device registration from
> the power supply framework due to inverted cooling logic and
> missing CHARGE_CONTROL_LIMIT_MAX validation across drivers. As
> a result, drivers that need thermal mitigation support must now
> explicitly register their own cooling devices with correct
> semantics.
> 
> The battery charger firmware exposes a fast charge current (FCC)
> limit property that can be used to throttle charging current in
> response to thermal events. Without explicit cooling device
> registration, the thermal framework has no way to reduce charging
> current when the device is under thermal stress, which can lead
> to excessive heat buildup during charging. Register a thermal
> cooling device that maps discrete current levels defined in the
> qcom,thermal-mitigation DT property to cooling states, where
> level 0 represents the hardware maximum current queried from
> firmware and each subsequent level reduces current to the next
> DT-defined value. Track the last applied FCC value so thermal
> limits are preserved across firmware protection domain restart
> (PDR) events. Expose CHARGE_CONTROL_LIMIT and
> CHARGE_CONTROL_LIMIT_MAX as power supply properties to allow
> userspace to observe and control the current throttle level.
> 
> Co-developed-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
> Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
> Co-developed-by: Umang Chheda <quic_uchheda@quicinc.com>
> Signed-off-by: Umang Chheda <quic_uchheda@quicinc.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> ---

[...]

> +static int __battery_psy_set_charge_current(struct qcom_battmgr *battmgr,
> +					    u32 fcc_ua)
> +{
> +	int ret;
> +
> +	mutex_lock(&battmgr->lock);
> +	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_SET,
> +					    BATT_CHG_CTRL_LIM, fcc_ua);
> +	mutex_unlock(&battmgr->lock);

I think the entirety of this function, particularly the assignment,
could use this lock

[...]

> +	if (ret < 0) {
> +		dev_err(battmgr->dev, "Unable to read CHG_CTRL_LIMIT_MAX ret :%d\n", ret);

style: "ret: %d"

[...]

> +static int qcom_battmgr_parse_dt(struct qcom_battmgr *battmgr)
> +{
> +	struct device_node *node = battmgr->dev->of_node;
> +	int len, ret;
> +
> +	ret = of_property_count_elems_of_size(node, "qcom,thermal-mitigation", sizeof(u32));
> +	if (ret == -EINVAL)
> +		return 0;               /* property not defined, thermal mitigation disabled */
> +	if (ret <= 0)
> +		return ret;              /* real error, propagate */

Does battmgr really expect the OS to house this information? Can we not
retrieve it from the running firmware?

[...]

> +	/*
> +	 * Element 0 is for normal charging current. Elements from index 1
> +	 * onwards is for thermal mitigation charging currents.
> +	 */

Documentation/ABI/testing/sysfs-class-power:

What:           /sys/class/power_supply/<supply_name>/charge_control_limit
Date:           Oct 2012
Contact:        linux-pm@vger.kernel.org
Description:
                Maximum allowable charging current. Used for charge rate
                throttling for thermal cooling or improving battery health.

                Access: Read, Write

                Valid values: Represented in microamps

My reading of your patch is that you expect a level to be passed, not a
uA value

Konrad
