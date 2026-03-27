Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D36E55A
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624595; cv=none; b=X3zVyc3XiN04noBIyNdG5Tb9pBTOt27/7ruRAo6HmePf0ZDWOMiWMkBJbkddSi/zXcSSogTi0/Sx3ohI6bLfv+A2vn2MFY9/SOigxHE16yw4hIwcqaePogiEl28bGHg7JtTQkbUjIRQ67D5WtADL4KaXYuzNXP9DboAXCkzDr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624595; c=relaxed/simple;
	bh=kESptFBDBL8DIr2sqVbThu0J+cCryhREGbJbLhwgZJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iA3Fst5O/UAj4dFJ3k3ZRacaJJ1YASnYLITZ/tezRWwYhexDmtq9nXy36N8K3CN3r932/29RTPbxpbO1QJm6yp7Cq0oKHgokzUdH8jRJQ5hmussa9Emv4fqRoMCodOyK6mtyigaztZKmwBnKvPCots5E2eyBxHNkkupRuQLWuUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOz1zpxH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTT7ytIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOz1zpxH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTT7ytIx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDh79W3747872
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W/COnF2VqwKqDpOlbdgOGs0G
	Wiv6hYIIIWSxhc/ka6Y=; b=AOz1zpxHBbzS9HANypIcQH16CPAxTtoftUzy0CPK
	Vw9ST4w4i05fs101yMnnWgl/sPQJfSlFvevLDJ9AX4vca49hTUwtg2YzCNiz9/3y
	wiVors6xhPIEgf09JMPXKOfl4wzIO40osloMEC7Oj3K8bjwqVuzF69J9QrSLoHkA
	5N3aeU51JpjTpwAaBOsbqcDCkNgLsvHyZ204DcAuFBeSu3gW5jqc5SCeRCVARHFK
	PkI2BEDjwY04Do5jjBppkczbi16BXtbvvJq75Echat0nLM6Kaq8rEjFtm2Kxo2+i
	2sjaMQcAQoLIg1LrcoVD5jQf2XIMlxgXsNBu28s/wSWSkQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhgjgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:16:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94eb42456bbso822449241.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624592; x=1775229392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W/COnF2VqwKqDpOlbdgOGs0GWiv6hYIIIWSxhc/ka6Y=;
        b=CTT7ytIxXaUFsJZ9zXFsMpoQPNgcxQRZooCRN1hKC/F9huA5a0dhaT0CtRJMZXwW3T
         UJ6SPaJDuVwjZI7OG8/vqUjmFRtBY1JnbtLSTgVsQi2k87pQsy0CNre+xB/9l9BNpv8l
         mvIz2Hy6W0QxLLWhq9ndlpjF7Nijv8nan2nqAtDjYJHMIRJUU6r77s70JZ7SBUESEMmF
         RUimwsG3sNrrt88OgqxZV5sZaJ0YpI4c7SpIxyxr3/3MnULxvC5Qq/SqaKTxCfKCvF3K
         nZhkF5hUabKnEa3KeadFqR9AzGJSMKo/2PfEpogGwew7tdNP5DyEzSmQsuzpcKVDTora
         dRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624592; x=1775229392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/COnF2VqwKqDpOlbdgOGs0GWiv6hYIIIWSxhc/ka6Y=;
        b=PLCz+wYwyXHPryZegAk2fXdGKWBBLkzgI0VvvYj4IupeWdjNHdM2ZdbpN8SwcAAOmT
         hK7gDl4/NsQa6Fi1F5mTFYbq8vBUTd1T2QJa8Ijod/4T66IeCyXa6M6N+stDJ8PMO7NH
         8tYbTespAcoNzo1G1s5wlc402BZtsMiAFSgO037RrOv6yIASS3+DDpd5eGCXSQE44uw4
         boZeNKJWG6tj1kTFmc9GQJtgRHwTMkj5pGvQYcFLLL85LRZiNAwLYruCzeqSfBCAwhv0
         C0bqmlv+Be4InZH5t00/Rj1mZGQrI2kIyaaWcwGgBcBsdC6Kev9d7P90nLxZJ7NtgxnY
         9zJg==
X-Forwarded-Encrypted: i=1; AJvYcCVwCyqn0iInTlfg6EiwTFSKWr8/Q7x8TBXwxCs8HKEQouOuxZ/QJyoggglCDDCAzOVxpw11Gm12vGwq@vger.kernel.org
X-Gm-Message-State: AOJu0YxaGub1DNKUd16Yb6wsXlftHk6LFkyfxarciUzA8zgEFGQgwYuJ
	bHTvtVHvXign1NbVsTA9jZaQDrytDQT/DD7ZF1A2j+tFbdZvMsK6Zk+BleSlNxNWSe61qpKbQen
	I8G8qm4lEIfTzZY/IVsY4V/nP0dbpvRvrbYk9gsYNYy06z7zlwcQq3FoCNvNha/0J
X-Gm-Gg: ATEYQzze/g2iO4MS2l+es7tTd/cQUvcsvqRINnwLETM12SQ38CRcPW7WM1soMMNVDXo
	YXi1WoJcZR6hs9DG37+BBdARAt7PIbE+/f8On+CRtjecvOi4Qx8KkqKC9Xx7yORtOEG+cZcvBG+
	t2qnGr+EMF1Xdw9t+XlghhTTWrPXTvHoFBvjWl9AEWP51ud1c8A+E0WktlJLgCSo5vQvJj4T62I
	r1QVHW7/k0Vcstz4ecIFfnZ6YxOtwgOjyZS6rH+PH2oA/Z/0z0egE3mmATywJo/1hNHD7TufS6C
	txmvdGn1FedNQDZt58VBonc/6hQ31OZ2z2tdYtcyMfb4Rk/Z8AGcfe233u9CEMyha5y1rLicWGh
	kjRWr65NX+BDKeLsZ10yUFpbLXq5X88LaCA==
X-Received: by 2002:a05:6123:163:b0:56c:d58e:8c0b with SMTP id 71dfb90a1353d-56d4a61e528mr1183503e0c.10.1774624591966;
        Fri, 27 Mar 2026 08:16:31 -0700 (PDT)
X-Received: by 2002:a05:6123:163:b0:56c:d58e:8c0b with SMTP id 71dfb90a1353d-56d4a61e528mr1183324e0c.10.1774624591163;
        Fri, 27 Mar 2026 08:16:31 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e722dsm14314839f8f.35.2026.03.27.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:16:30 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:16:28 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
Message-ID: <tj5tzi7n7yaw75uuawfcgrkoxnu5dnsh5dnsic5w46lzt42kxw@jd444ivlz3br>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <20260326-x1e-camss-csi2-phy-dtsi-v3-2-1d5a9306116a@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-2-1d5a9306116a@linaro.org>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c69f51 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Bs3EkrpsXgtF9MbaLHwA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y0GVwqbU48bMs2mhdLm5FdoQz32nStVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNSBTYWx0ZWRfXzDKeFYdUCAbR
 L5Gw++aeSeFWK9tD3gTVZjgD+ig2b9SqxUqVU4kCLuAHHs2te+VDvA/w51PCS8oBTST3PWpPFFW
 CyCOJqrWHDDoUmJb4IdnCPZf7UJonu1uoGD0qr8ACkwbs8xpBVdJ88stvUr+qGRtXHm8l12uVN4
 ZS5zlknfkRJUcq5cpbiYAn7HA7Nht0696ds/SYGX1+EQQoN3DvRTFVWfdlY4YL+euEK1yI85qpW
 PPk0WSmw1XchEmTE9qmWQBGFmJToqqln7Q0KWk9NEo28YoOWs7R0otA+z68tTSYNIF61zlwaQkk
 Bl0y1WiXXOxlLzkp+q3vsP7VcmoNAkAfTWpOfCL3fYH0Gqj3MsjaRxfCMbx6eWfUmk5Jho0glUi
 YAGgqjFgB8a9FOeHz8oNL0Zyr4HIaDZkaTc7uLMvw9URAIvDVvWgO53a3ywFDi8M2BWAK/34xaP
 Ho2J9FqSmWG0j5WVy/g==
X-Proofpoint-GUID: y0GVwqbU48bMs2mhdLm5FdoQz32nStVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270105

On 26-03-26 10:27:39, Bryan O'Donoghue wrote:
> Add in two CCI buses.
> 
> One bus has two CCI bus master pinouts:
> cci_i2c_sda0 = gpio101
> cci_i2c_scl0 = gpio102
> 
> cci_i2c_sda1 = gpio103
> cci_i2c_scl1 = gpio104
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda2 = gpio105
> cci_i2c_scl2 = gpio106
> 
> aon_cci_i2c_sda3 = gpio235
> aon_cci_i2c_scl3 = gpio236
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
