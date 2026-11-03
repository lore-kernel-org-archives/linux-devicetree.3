Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730345;
	b=jK8JgKifnlkMQfxaWj7kR3MvvZqIaVtgHZnipT3EUl6dHk3dbv7ZepOLdiQeU1LWtRtR
	 7ZOJjfJ4NHSf0tCEKyhUUN65+vhIrFT6n8wbHA1gJkVX8xp4TLmUroJNd0nDlO08pG6yo
	 QIs6OjjbfzSU+BTM7k/q+6eaRlUdzA8YC40dVrdKTBYwMHv6/B30YdCErdBDNBqF56ygF
	 CGzk9+R5z1hP00J+uRuYPATlQb6ZZf8/x6mDQxrBSE5TJdCVXhAHGNCa7orymFEgSRVee
	 FnZ5ssLBtVI7NZLeo68A0/fpwJzxorkGRc7+qcD8hmzFCZyRWnU85Nl2MO5gmbc5SWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
	b=xUuoKTFzSpCPSJ/yqcTOAsIxhktLO3ro3DtS8fDrHbo1kdbCjF0wFRH4CogvZGhBsSdE
	 GdcE796WXYiWmbsVWr1PI654KX1oE1m5JFTKjzB1AloTnaSCasxYCnrqn8p002YivIVKc
	 yZQH4ksOVN7u33vFZKlUNgIn727QrQACj27gl2QSEXwklbwzcDZ0vloDDmJz3DMB3vMjp
	 kJ2Lp5ZbUYwX7rCk6j2oM6SQx6tPEKYko7rnf5sRd5ODNMQNhaRK4hlkyg/n/hcSdpgEt
	 djVyUtfv41bvsRemrVBA0syHQ4d0ONT4DnWQp3+AGR9Fqn7VJ5psc145+fKaBoaq6cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBNpcd46;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YdU+kBZq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D3606D80B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 18:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779D3606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBNpcd46;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YdU+kBZq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3I3nWc2518224
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 18:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=; b=WBNpcd46dTWj1jQI
	ue4Od341ZIwYNIcE5jT5ZW1L+CK7vBaVe37HmFbqbmPiU5rzfrsCLRtSvL+oYa9j
	D2x8RJFZ1IHrTE2cK/l/Zf2TDw6O+J9Pu6CktyfPFBppLmcFX+VYiK3O/J5rqhPZ
	DdZr4ZBCOSL1ERM6Ati1iuOT0ZBg/K+hf5MoYKun5NiED65othJk1cOzN2YmteL+
	6yLHRZt+LWgQThiqi5nXk3aYFKykue5wfCJGmOIeNA+TUeIlqDCtug/SW1GG0lWN
	kQiNt0jqayGfMtx3aSXr4Mo3PoPh3mecdV+5dWxAkjLSppr+RxL2ABNvqlOv9nV1
	neHakQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbr34v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 18:25:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so17251567eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793730342; x=1794335142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
        b=YdU+kBZqMFs8laiF9aAtGTlYQDaGmuzmWoW6uwXzIFr+G4qLiBfrIHM83UJOHnNo5f
         a5LNeRBabM0vGc33To7x8tKYKKqqr3u8DtFWUor44TK1ByKYupTJHAM026idZt6O3WOq
         dBCcDMgm45nK23/hKKrxAC83IvkNLSV6w0vMVkTz/x2BIftB8yFhNVkCgvueACQGJQib
         d/fGOxXhx0YD6so16K9cMl98QpEl9uGhfZKwfX5Zq8hpvwz9+VPvfaL2F7j17IIbsfQ0
         7qmvQB6BSs1fK/R83Wz7lqF65PemHXY5CSWmRYmc4I9bAxOnRgWLpFNYiHny+f1XDbBL
         eedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730342; x=1794335142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
        b=vmiuoWIpBiZt3wRaLGpjyjsuj/GPCxF3JepotlRgCqznug/ydWaYgZmz2FkAzu9AUU
         XpsU7yp72gq4//G2Dq/JQa8ifQj89m5UCydhcpCA/otqU+ECn5XI3F/wExyanYtNHaAa
         COKg1SPlyR9Ob9PDBCV2rh4oxH6GTKoZbLJvNeM3lReQ1AueIRbi8dSGOSrtJUA55HCC
         L2ZzH6FUZgBcWWlSYfGYzg6cKpf9Z7EbNzIxVXDAgGd8yl1MMbfny4i3YIv7ERdm2fKn
         YJXUKJbltr5fG4uOQU/PfAdB72h3RPbq+gYbvNoqKYU92MXxUdW+KQxI2Qej51k/P0/l
         3/Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwudnyfReE5zJGWVEXSfH4SR8QgQ/SD2NXzDfbrBDfa0E6u2/5SBmo995Pf6wYLGsAjcZPnQuigiXAK@vger.kernel.org
X-Gm-Message-State: APuU4Z+oOL+mANjAlKPtyyf3wxlEXVa2aFTydiOBYgO+CfryqTNS7f+R
	sMzGuOVPAuLuU0nu71vRUjbpIMZDb4rNh2hJstf5lnQp4AmIkYQfxOeWpyGvSbQxRYXdoLUxC/5
	9XMBCWaLUP8+rRKw5t1B6sPMBvG2qdl7TNYlpawDfqi4WMNfT8E+GohqHgl+yxSSM
X-Gm-Gg: AYBFou1dgo8biwrFbYNrlW6zBVFuT9UmCwI51UEfbYzddPJQ3O8yKrfWTnaPZm+4uZy
	wkXRN4PMDDyNln/mm01cHAmP7SWO59p0fhGRBFD9yIt7sRG6PuBgKHwS4PTBE5YCKX0CZ/eI0aM
	gtOLHMFSu5YWFnLcxSKsmq64i0lKqqUV/Rwbx59JINkgWWbQwEGlqwQNWRqZR7hOMkNrzvwO+Xp
	NEoMILBErF56p+qHP26La5m0cY7sJFUJ8TCV3DGk40oY18JMEjX1d7uCJ4itdibMaKlosepb1MW
	v8t4vI3u3MKXZonbbG026PpG0JOFZn/funcT8Q3f8yIvWVQ5KD/IxBNIpxXV+iHKaCLjBz0b6+b
	gm8pau6QBPnDVk8Yckszh2oh+H0+ysbxevsSMdsOrxqWBH7HYuQraQyNC2p5qFZs+cSkOKPlDgy
	96
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr19146158eec.2.1793730342282;
        Tue, 03 Nov 2026 10:25:42 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr19146127eec.2.1793730341766;
        Tue, 03 Nov 2026 10:25:41 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm51979568eec.7.2026.11.03.10.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:25:41 -0800 (PST)
Message-ID: <a30d7d12-9cbf-4920-b4dd-d9791149b6c9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 23:55:34 +0530
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
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
To: Christian Cortner <ccortner@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9J4zW8ZehkOF_e_gJqijMRpa9DipNKM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX+XxVaHoCQOGQ
 3fV1cbZBKuIXE542HJrq2DNWGATEloG4KOlwN+Hf9CuSkM6oouNVpO8e3hRFGV0uvrJ9crenUZ6
 f/6zNJ8e7oLYNLRpmT1j0kindTcSwnzGau88xVq9bQGWNe3huROJtvZubwINlDDmAWOBnN6/dFU
 HaNqIwSkWMqYqMIANMAmaO/uZr0PnFZwGA0h2+RauMAmXEEenOPY7NhDiLY2ZoE+2pm/0FTkWvp
 GrXm04uuHYhEoU7PJ4kOyJlRVgts+YoR2zMRSBSbp/YDC5zXCnYUashlew9OosAhgJimlbXi7kh
 Bs9QGsmSICJvz+TUCost56F5zCrvjhzarJ4MCLGFDQUBD9bIRssTxs5Ob/jXI7ONl2eV/34qEUA
 q50+u0IukDBdXW31jtkmQkffZXHgLQDcPA9RAfq6UudA/Mx17S3aynpV/nVJ1QF2CSGE3ckSEp7
 wOFGDSVd0NnV2Lw3n8w==
X-Proofpoint-ORIG-GUID: 9J4zW8ZehkOF_e_gJqijMRpa9DipNKM7
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea2727 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=4afNKWI_y86-DhA6_rsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfXyC/U+nUtid8v
 i/tDTjVKEuVfDUAg8RCl4GiJXRjRW1TRbXVsLslT6GUkJ9EUvqpFeZMRr+STbyn7hdNy04PYItG
 zHrUL7ye2GWk6iqFVVWrY26UwtpIWVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030073



On 31-10-2026 21:54, Christian Cortner wrote:
> For 1-3:
> 
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
> 
> With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
> CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
> through libcamera. The A16 node is the CRD wiring with ov02c10;
> happy to share it.

Hi Christian,

Thanks a lot for testing this.

It would be great if you could share the A16 camera node patch. I can
either include it in my series, or you can post it separately as a
follow-up patch depending on this series, whichever you prefer.
-- 
Regards,
Nihal Kumar Gupta

