Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524998;
	b=GCTIWuPUP0Q5JdTDn78CNKKdTsfD6LzDi9OoA75go/kIqZ6Ub4e3d1UIDrnqo1Z+RXL+
	 3+SQd1Gyn9l42R6i15TNVDgqzBvbcUoc3y7g5ZmsGZIPtkZ0Y7OepwJv/2uA9JbL4zWdZ
	 iqYtrIEHORGkjE9ERGWRJ1xwBpJvSQCyDRsCNqiYV4g4Lj+i87Dt97zvihd1d20xGhzyX
	 CBIkESXtX+LArUtSV+NfiD969TZRm+e3bsqy4IqN1mADYPlkwfkBdKdD9CTFEBARS8gwX
	 1gAMLdDmhaV31AvH/NzqVCqLoLQq+EZx5wLguH3yv0b/QiTesul1df2cSuL7kso8aSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
	b=dK3RL5+IWujmHzD9zuTVUzynAJTXmtVuH8JgBAA/1u6uS7rxuNIdiriajwrm0BU1jxnl
	 ZIG8bhjq/oFRkn5oQjLMxlTp4jauhygVjHzclGf5i3gyVrjDwSSVSYrZuMSJWptC/qUq1
	 NQiS/QjS6IleAzfpWrTB+RTZNmYNVlydTx7Mx2JS/WoQSn8UgGfeMiDiWb2T3ogUYNsnx
	 EkGL4wXODIjrIA06qInB/VFHKa+B6+V7q7lV2tPl2B+OjrRmVWTLnmHgJ7VqvCanbzqFL
	 XTS7bBVWUNnZbURjLKH76U4MpeLd3OLrYZCg8o5otMZ2Ob24UMsBk6GqapoXCP8ruXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9l6fBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U6sVP8mx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46605606A332
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46605606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9l6fBh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U6sVP8mx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuJ3g636648
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=; b=DF9l6fBhukovloIC
	lPAH3FWFLecA/J39y/gmIcTRUZ4Lq6KdDnf7flVguXLxS98olplmggiZUXMdOIB1
	+JlpZBE+CaOqvVWntozlbjrGn6AftMMOpc8LyhzNuhibzbGLIz0/Zt9nW3v8RW5q
	w/F/ZoQAYlFQNrSu/yZ8aeWv5iZjgv2EJPhYqJCjy00T79DfpxAfSxSM/SNeXj4M
	rQcE5pKEZCYXh9LTd81L8LsMXbMw0XKfa5vyEiCfqs64YvY18Y82JnqGBgB2n4Iv
	GiiS60bcEkckNkgC3aYBeqNE2JmW8vKrZuL4Bv2vZ3Wrm5hTNG1EJJRis2JmeqdY
	NcTLZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rphrw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:56:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8c5408e418bso3218747b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524996; x=1796129796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
        b=U6sVP8mxSKlvEm/EudUn3ZAej40wOKduQD5NpBGJqkNLRX9WC0UvxxQ2E1Xjep/O2x
         Idkq77kpvilQ+6Loj8UnNwkOSwR9qp0RmjsPDZgNzXmzvC76q/Tlqt/inVbcIQMFOgNe
         Eq1beSkFD+isz/6vWfBm5YYBBh8KZsRBvCxSzE+sFXWQJQLuyfedCmfjEyVy1Gteb2Nj
         K1q9JNsitszecM573L/j4MG2cCjUTDMDid5Ct/LOyS7tIf8eUTVl/RbsoL/w5kMLHTRi
         CQAGsXsAeEG8xgv1NGvVQ+MJS/4TknMKpwh2p2JPhqqXyaUWKk2Qa3ofPCW/JChA8KnE
         DYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524996; x=1796129796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
        b=Txnc4ir1r9xvz8R03+cb0cnaRIWM9+r/9M1cApr+QaGH0UyHn4mrKZIvGlLEFu15Rt
         SeAoLlras3tvbgGLWnk5gTMLLDdjOdEiZqZMfX1VHp/T/CLzt645MYhS1CJZsJpXLf6O
         wM9TN8xrHfPYaIXLf7fEVc9UEqpxZ17aYWnkmJdAqKIjXhKxnl0qRtc6MfBZpc12N3dq
         KpntpzrDjCcW1oRVXj/TnAzqXAnIAtJg7ZVjrtyIoAGpk9Tpdloz9loP2n6lUTkvvRsW
         kzszbuUfbaWOBa6OtdA00F7+KjGDostdnzAhY7IcSs4yTCfsIYx82bK1hAjtLLXXNwe6
         SJyA==
X-Forwarded-Encrypted: i=1; AL+hErEQqXMzno5rn5gCWKkGwSjf5z4P69VyZzpH8X5DD738prrvZvUI3tUZFH1s3h6FtP/mFjOwUvdq0soY@vger.kernel.org
X-Gm-Message-State: APuU4Z+AdAizENiMtWLw+FwEHwvR19ec4DQ++CG6hM6PzPFfjNw5/3hh
	8BdKisj7tJJlJrjzcwjkdc3m/pg+y8WoTVDsQbFPrhvDBWaDTgRp9h5JmcTZPN2c6nuDpBWBolZ
	pyU6qDQKCOOI4bLF5w5rV8Qygb7Ety+W6j1OgukIejNRsPhLoJEiXEWAWuCBU3/SO
X-Gm-Gg: AZFdTZdLYHJlykAkaQcazHjZd5Joj4D8qd2VI+D6UXXAFdGyIy6nGK19DVMCOUBZgql
	d4hbj/eVqlHgRIzw4cET4C7YMrIbVaLx+Mh5KJ57gk6HhWpu13RmTfHALZzZCj5VchQilGdqnZz
	RtpRbiS6gliPHYB5IX5Tew3IyfzuR8kARvlkCJtZE3ltVCxRppyriGerbp0pOaT14jeFF8y7TYE
	PsC3+6P+waMHmLrnKK30AMiizAJ/HZW+PPgH0dniwfiarQutRXiQU1BQD4oYkFV5F6kx5SvEkjQ
	luyvHh9IQ8KikS3L+rJghUu3w0uV8uKChSlGU1hsM/dGyYR2ixihh21+BXlwJzum8bErY+W8GnB
	FcYteCCRJINfzvnwsdkazNxOrqM5WjpSGNV9HkeN6YlPH/WpUEL+k2h5W0rEloU4iof9QETdO3H
	q+Zg==
X-Received: by 2002:a05:6a00:4c19:b0:8b5:f313:9f54 with SMTP id d2e1a72fcca58-8c87d32b35cmr12156941b3a.56.1795524996080;
        Tue, 24 Nov 2026 04:56:36 -0800 (PST)
X-Received: by 2002:a05:6a00:4c19:b0:8b5:f313:9f54 with SMTP id d2e1a72fcca58-8c87d32b35cmr12156914b3a.56.1795524995577;
        Tue, 24 Nov 2026 04:56:35 -0800 (PST)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm7146216b3a.11.2026.11.24.04.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:56:34 -0800 (PST)
Message-ID: <0747efbf-c712-4185-b08a-82c82a49b4a2@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:26:27 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add Parade PS195 bridge support to enable HDMI on
 Glymur/Mahua/Kalambo CRDs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
 <357f0fcb-792b-4b40-84d2-cdfd05ca05eb@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <357f0fcb-792b-4b40-84d2-cdfd05ca05eb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX1YudTQPBdUwE
 C00hORzHL7zwXGlxzmUypAFtMrXEuAp8xOUNI6V0IwA74dIUehrewPSOtMPCLqeuMQTnhrhgUir
 30lycA6pXk+dEK5AtkcQ7GhgdRORgmR74GRUTwQ9l4h2g0XPorbIsVoLRlgumxehoasWuXblkuD
 qyMKAvEkrsJFlnaG3ERmCoP9mpTDzPFu1Z7jdn+3eWrChjoyIu7XxULk8FbHCpQMN7a6LY3t6GZ
 wCLJjhs4c6uJ1vAw9a7ogMYjF0IyYUwsfMZtkoUfDgW+xqJImKbuGLM3J7fHsp/qVHOXbnow/nm
 h0VNc6rjkXKQJwhtOtspB/s5SM6qm70XE9y2XWYpALqy9q8jkfhYgFDGLy3eABNtlWScrUZLLV/
 NTQ8YlWbCogca1OcBQFBZ6RPF6AFkpgKHoeuZcoBHCli/Wwr+olQ2vn5n6tuMKf3XOtp6bpnhlG
 j1PlS5WEbBWYvDUzMkg==
X-Proofpoint-GUID: opR_BUcXpM82ClTcyBTzNSxAtVFq_8mz
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b058985 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p1ES9sUSU55KWy82zVEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfXw6NTYGLRrs/Y
 bD3t1wIWpxpFTKUdn/fo7aKKVsJzzXoeRtjLph2Fe634XknpoTpwFZuNIppiaenyJYUHFJeYKEi
 8bFlglkPNuwU+9VK8bsYtFM6/vcaMTw=
X-Proofpoint-ORIG-GUID: opR_BUcXpM82ClTcyBTzNSxAtVFq_8mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240050


On 11/17/2026 3:54 PM, Krzysztof Kozlowski wrote:
> On 16/11/2026 12:34, Nabige Aala wrote:
>> This series adds initial Linux support for the Parade PS195 DP-to-HDMI
>> bridge and uses it to enable HDMI on the Qualcomm Glymur CRD family
>> (Glymur CoB/SiP, Mahua, and Kalambo).
>>
>> The PS195 operates autonomously using firmware loaded from external
>> SPI flash — it handles link training, EDID access, and hotplug detection
>> without host register intervention at runtime, so no existing bridge
>> driver fits its power-sequencing and reset model.
>>
>> It introduces:
>>
>> - a DT binding for PS195 (supplies, optional reset GPIO, and port graph),
>> - a DRM bridge driver that implements PS195 power sequencing and PM handling, and
>> - arm64 integration (defconfig + shared glymur-crd.dtsi wiring) so all three
>>    variants can route DP over USB2 QMP combo PHY to HDMI through PS195.
>>
>> Deps:
>> PHY PLL change: https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
>> Glymur commonize change for regulator: https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/
> So this cannot be merged. DTS cannot depend on drivers patchset. We
> talked about this multiple times already, please do not couple
> unnecessary dependencies.
Ack, I'll remove the PHY driver dependency in the next revision.

Thanks,
Nabige
> Best regards,
> Krzysztof
