Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461334;
	b=lHWfv9P2xCMJYfACGSaAsNoA1EjHvA64VOXLd+KSzz/e7SlhFzTndRcq7bwyg2dg3as4
	 oRsi29QgzgngjUoI9iWxWwqNlQCqt+D4/GteZTrY61G282KgmIU96N4hvt92c9xaeMh9t
	 X1nd0VVi6w8A7zSBii+SxzOG6wd37ge+lmxIVhmSPYcr/PzsBqiZCFNV+xeKizKEDMZ1g
	 qRqYzxIkBAYnCt6poFxsGMkoWIzbMVxVPmdIigurHVoOMf5UU7hui1t+moeep9XoczNAA
	 j/jL4kpns/nTFuzFF7IGAH1Fx3jzgfX0TG/ZsXv+wC054WDbgqMZY4ryNe5FaMhttew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
	b=CzH2Azghekm1jFsrfEny8aqSnyYO1pyqMvoFvx9RJfeGHhBViepN96zv/aEaLT8a0KPd
	 ilYsP0Gmo0XXV7EgE3KBtXEjN4BQR7HEYBJmGLxMjTpIw5t3NXkI70ck92nmk1p79i+mp
	 ZwYyxPdoqsfrYEkA7bOUu+j2EW/Eio5qG28mavVeFuPlj7OBqA45HROuUU40+OpoklIz5
	 t8bKPePqrwe4jTZVOMS89MgKJ0JMQbw28HJXOm6tuJM4qaVosgmLu6thwvUZ1ivxP0VbZ
	 tskFojlJf1E8daxazrq3Gtbr/gVLfQhpbDaJpzq7uavTc6XiFNuJcrfFuk6tYCvyYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZmKGfkc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrxAUy2e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A7606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 15:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZmKGfkc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrxAUy2e
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxsDL1629924
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 15:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=; b=jZmKGfkcQHp/K7Co
	1SBTyA2or4VZDoYvwyxP/e1gwPL/aAD+pva6G3TGl59sCV4ALs0QuaZ3zQ4U7yt1
	0TWtfTWVRDKV9oe9WsiJqWKIpTiutiELbnAsnzx0pickcQs42ZU1718wrQnS5NoY
	ubPRVou3pQU+0AOcGQpnTb7HPfQur/dcnXpzLwkoAO9VnoY0Nf7J1xm+EinKNAMa
	mG0NUXgIN8MaiHAJgCBK+HKPgGcn2UjEr1GX+yzSgLGyxWdtpZ770AVgqcusx5f4
	eInPboOgp2Jan5w41YcYmPfcJZdE42HsklZ78lLJaMUtWd/dZX11msvDweBeS6+2
	m5g7hQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ehakx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 15:42:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so2386226eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793461332; x=1794066132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
        b=DrxAUy2eDbNC6HwN+15TtW1OFuCUq1J3wq1UorhE2QZDz8g7V/JmdY6rtCD+5K0D67
         ip7RAOA3ii2Hm6Pue2gQYJfzx4FyuYJkCOFgO2oxnYLKPoKjipZiPA86WT7JK69mkwZL
         lt3dauArxLQGx19U4hnJIX64vt0GlmJuhKo0koeVAhMbz4oDItc7u8+18YhyqQ/VIxlX
         ZKfA9qD3hcX8g03AOutK0CKnLb/5rwiAmynDA3NVClc2iZbdTbIgVEwKmELbVr+pZZe3
         b4jbsqqxTfjRzFHG5GFBpP8W0ioJHRFdwqe8ASKBy7pYwNQnElg99XgvPNDXgRyi+SRi
         yyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793461332; x=1794066132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
        b=npKSAoBM5OEEYtGhZeRNAHao/05eve/4iGM6qfDkNbzpLZdjRcTO9lc/T1Qp9Cgw5/
         l7a8gNRJSWV/q8H74CyepBrS1cznLFuePMxWyNpR4YqGnWVqnQh0eE1BTsSYciqhpzrb
         hpZa9+wkrXevy0Fbv30H2RCGfDJAnaYvh6Palqo4ywva+X1i3mVM1lNM5GgUa67KZYe2
         KAt+71Z0CtHjhtgmyJEjy8ZvQOyGixd+LuCR0pwqS7Rp3ubo7WiKgBMzgzXecPGtblC0
         eeIFfWO75C0y41gA+GQJJUlGprv80VDvb0s1F3XDP44lMHvBWMzYUCARt5hBGlIckJlK
         Axug==
X-Forwarded-Encrypted: i=1; AKwUvBzOQtM7d3XEnO4+KifAvYqThbQ6pG/01Dekj55XEPcPnE2JAq22QXSTey5NHDEDmm2aFaibbr6RFUv2@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5ERDrOgE7K0dJsAVxlGHgtV3a0gM9mWCmHhvqiTeb3MSbhDqO
	olVo5HDU9x1OwcFr+CM86RCAv8mLsVytQwL77AhfQJY7YGkAETY0f0btjnbbiI/TRpwBN27ogHJ
	Ximf18jafQnPglemwe4uIwhUVaCm3irftaw3wqPtH344DjIgZAOlA+xC+tP9Ainv5
X-Gm-Gg: AYBFou1xPIYD9J87OKkfx/QgTfks0d7WR52zYt5a81i1D4jFhYwgcLBZ4lxeYj87ZES
	HbuiZDlMfXPODFUn0YDJuRTEdkioC3amw3P488/WSWtLpE2JFY/zetpmalz0XakA8zwCaQ5s3aT
	4oRmyB+z4w8nF8lQW2ihALntx3X4RZKdRgmPh2Zt1hFe0AR/iLtf5bYW8mueOB/BuXHWtkHCQjH
	kmZ3ebEOnUD8OqixZfM0vEK2yyazzkewzk7kmO+NlcpYlhMVMidFBS38ZweEAEpmVoXt9FZ120B
	BkWSB4Hhqn+aOduIuTJzxxfOeiTSA2/EIyGE26Dh9Zjh3Pi8HoTPkBjQJGL2VDYfZWKa/rd2HMv
	3nA1OacN6I19AXq2jFsDRXQt1K17poIxiskSvUOzdccLlScbXaw44j8Ih2XyOWZZwMtkWJ7W8UJ
	A=
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr8367553eec.10.1793461332263;
        Sat, 31 Oct 2026 08:42:12 -0700 (PDT)
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr8367488eec.10.1793461331549;
        Sat, 31 Oct 2026 08:42:11 -0700 (PDT)
Received: from [192.168.1.6] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm18944606eec.9.2026.10.31.08.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 08:42:11 -0700 (PDT)
Message-ID: <f033b603-d397-4397-a2de-a3014c997278@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 21:12:02 +0530
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
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
 <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
 <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfX2b0VbH53rG74
 5GSrrJMi/ic8KfcsaA+2kXGZYi2apj/QFU+IK8dH9lj0xbg2Q0u82sEAO0KnJUlbbHEYKkLBqhx
 kFmKDXs7s7HZByr6aH5AqgD3j28RmqOCBrNBGYNEGXDv5OF5CG3dPrEnyMlRxpXvW+IgWp3EXY9
 0m1iqufL8JRq/yHN4AGILTJmxudqy/VWDKuL8psRF35CcqsYuP7Xc4WkikrFEg52RP5TTZW+qWt
 7XG/pyYilOSyzfEiGNgni5xUgZomYttAZ8SO+9ANRV22RtGUyGnP1SmC35SBnPVEx3+BCU0/mC1
 RIai9UZQ0iS2K5MO80ZzUl75pKZQgf1iqWkPqrgZxzXggeD7d+sEuYPlyIYvzpJLP86/O1T8S/8
 mOQewPELruc8QnLBl6Xq5JWrMoIJ099desI4DLwkifmoU0MyndLt+WPQfr8OwahK5h1NeeAM+pw
 /OPQ9cUkqfw8RqxHhfg==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae60c55 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=fhbCC2ozS9dPJYT3FEkA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: sWfHyp0IQbseRYx4iEsm_tJPOgbIjdaA
X-Proofpoint-GUID: sWfHyp0IQbseRYx4iEsm_tJPOgbIjdaA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfXwSA4ZsYyoVWz
 Kkf14/erBbqZ6rVUJVHm9V+2c1GukjUK8QSjGquu2llAWCpmGsiCt7x43Sg2jqAh7uoQ0jWfpgi
 dTAGRI+KCwMxnC58xW/uNtll+bM0By8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310062



On 31-10-2026 20:44, Loic Poulain wrote:
>> Bryan, Loic, do you think we need that change now, or should Glymur keep
>> the current approach for this DTS series?
> I see in the following in your Glymur series:
> port@3 {
>    reg = <3>;
>    camss_csiphy4_inep: endpoint {
>    remote-endpoint = <&csiphy4_out_ep>;
> };
> 
> Which CAMSS pipeline interface index/instance is CSIPHY4 connected to?
> If it is connected to interface 4 on CAMSS side, then we should use
> port@4.

CSIPHY4 is connected to CAMSS interface/index 4, so the DT should describe
it as port@4 for a direct one-to-one hardware mapping. 

I will raise a patch to update that.
-- 
Regards,
Nihal Kumar Gupta

